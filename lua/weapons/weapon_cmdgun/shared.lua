
-- model : cmdgun

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_toolgun.mdl"
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {}

SWEP.Category = "Ricky's weapons"
SWEP.Spawnable = true
--SWEP.AdminOnly = true



SWEP.WhiteList = { -- THIS STEAM ID CAN USE THE WEAPON
  "STEAM_0:0:81568440", -- Zero
  "STEAM_1:1:18056707" -- windownsmp

}

SWEP.SimpleCommandsWhiteList = { -- THIS STEAM ID CAN USE THE WEAPON
  "STEAM_0:0:81568440", -- Zero
  "STEAM_1:1:18056707" -- windownsmp

}
SWEP.MediumCommandsWhiteList = { -- THIS STEAM ID CAN USE THE WEAPON
  "STEAM_0:0:81568440", -- Zero
  "STEAM_1:1:18056707" -- windownsmp
}
SWEP.CancerCommandsWhiteList = { -- THIS STEAM ID CAN USE THE WEAPON
  "STEAM_0:0:81568440", -- Zero
  "STEAM_1:1:18056707" -- windownsmp
}

SWEP.BlackList = { -- CMD GUN CAN'T BE USED ON THIS STEAMID
  "STEAM_0:0:81568440",-- Zero
  "STEAM_1:1:18056707" -- windownsmp
}

SWEP.SimpleCommands = {
  {cmd = "voicerecord", needArg = false},
  {cmd = "moveleft", needArg = false},
  {cmd = "moveright", needArg = false},
  {cmd = "forward", needArg = false},
  {cmd = "back", needArg = false},
  {cmd = "left", needArg = false},
  {cmd = "right", needArg = false},
  {cmd = "strafe", needArg = false},
  {cmd = "walk", needArg = false},
  {cmd = "attack", needArg = false},
  {cmd = "attack2", needArg = false},
  {cmd = "reload", needArg = false},
  {cmd = "use", needArg = false},
  {cmd = "duck", needArg = false},
  {cmd = "jump", needArg = false},
  {cmd = "speed", needArg = false},
  {cmd = "zoom", needArg = false},
  {cmd = "graph", needArg = false},
  {cmd = "klook", needArg = false},
  {cmd = "mat_texture_list", needArg = false},
  {cmd = "showscores", needArg = false},
  {cmd = "showvprof", needArg = false},
  {cmd = "vgui_drawtree", needArg = false},
}

SWEP.MediumCommands = {
  {cmd = "kill", needArg = false},
  {cmd = "say", needArg = true},
  {cmd = "retry", needArg = false},
  {cmd = "dronesrewrite_do_hell", needArg = false},
  {cmd = "dronesrewrite_end_hell", needArg = false},
}

SWEP.CancerCommands = {
  {cmd = "crash ( ͡° ͜ʖ ͡°)", IsNet = true, Net = "CRASH"},
  {cmd = "Delete all E2", IsNet = true, Net = "DELETE_E2"},
  {cmd = "Copy all E2", IsNet = true, Net = "COPY_E2",Sender = true},
  {cmd = "Edit all E2", IsNet = true, Net = "EDIT_E2",needArg = true},
  {cmd = "Delete all PAC3", IsNet = true, Net = "DELETE_PAC3"},
  {cmd = "Copy all PAC3", IsNet = true, Net = "COPY_PAC3",Sender = true},
  {cmd = "Open URL", IsNet = true, Net = "OPEN_URL", needArg = true, Tips = "copy paste url in here"},
  --{cmd = "Check sv_allowcslua 1", IsNet = true, Net = "CHECK_CONVAR_SV_ALLOWCSLUA", Sender=true},

}

function split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
         table.insert(t,cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end
   return t
end

function SWEP:Initialize()

end

function SWEP:PrimaryAttack()
  if not IsFirstTimePredicted() then return end
  if not table.HasValue(self.WhiteList,self.Owner:SteamID()) then self.Owner:ChatPrint("You are NOT in the whitelist...") return end
  if CLIENT then return end

  local target = self.Owner.SelectedPlayer
  if not target then self.Owner:ChatPrint("no target") return end

  if table.HasValue(self.BlackList,target:SteamID()) and self.Owner:SteamID() ~= "STEAM_0:0:81568440" and self.Owner:SteamID() ~= target:SteamID() then self.Owner:ChatPrint("You can't target a blacklisted player !") return end
  --self.Owner:ChatPrint("Clicked left")
  for _,command in pairs(self.Owner.CommandsQueue) do
    if command.IsNet then
      local args = {}
      if command.Sender then args.Sender = self.Owner end
      if command.needArg then args.Args = command.Args end

      net.Start(command.Net)
        net.WriteTable(args)
      net.Send(self.Owner.SelectedPlayer)
    else
      self.Owner.SelectedPlayer:SendLua("RunConsoleCommand(\"" .. command.cmd .. "\",\"" .. command.args .."\")")
    end
  end


end


function SWEP:AddCommandToQueue(cmdArray)
  local commandButton = vgui.Create("DButton",self.MainPanel.RightPanel.CmdListContainer)
  commandButton:Dock(TOP)
  local args
  if cmdArray.args then
    args = cmdArray.args
  else
    args = ""
  end
  commandButton:SetText(cmdArray.cmd .. " " .. args)
  commandButton:SetColor(Color(50,49,49))
  commandButton:SetFont("MediumTitle")
  commandButton:SizeToContents()

  if not self.IndexCounter then self.IndexCounter = 0 end
  commandButton.Index = self.IndexCounter
  self.IndexCounter = self.IndexCounter + 1
  commandButton.DoClick = function()
    net.Start("CMDGUN_REMOVE_COMMAND")
      net.WriteEntity(self.Owner)
      net.WriteDouble(commandButton.Index)
    net.SendToServer()
    commandButton:Remove()
  end

  net.Start("CMDGUN_SEND_NEW_COMMAND")
    net.WriteEntity(self.Owner)
    net.WriteTable(cmdArray)
    net.WriteDouble(commandButton.Index)
  net.SendToServer()
end

function SWEP:CreatePlayerList()
  if self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector then self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector:Clear() end

  for _,ply in ipairs(player.GetAll()) do

    local currentPly = vgui.Create("DButton", self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector)
    currentPly:Dock(TOP)
    currentPly:SetHeight(self.MainPanel.LeftPanel:GetWide() * 1/15)
    currentPly:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/30 + self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector.VBar:GetWide(),self.MainPanel.LeftPanel:GetWide() * 1/60,self.MainPanel.LeftPanel:GetWide() * 1/30,0)
    currentPly.Paint = function(pnl,w,h)
      draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
    end
    currentPly:SetText(ply:Name())
    currentPly:SetColor(Color(255,255,255))
    currentPly:SetFont("SmallTitle")
    currentPly.DoClick = function()
      self.MainPanel.LeftPanel.PseudoLabel:SetText(ply:Name())
      self.MainPanel.LeftPanel.ModelViewerPanel.ModelViewer:SetModel(ply:GetModel())
      net.Start("CMDGUN_SEND_PLAYER")
        net.WriteEntity(self.Owner)
        net.WriteEntity(ply)
      net.SendToServer()
    end
  end
end

function SWEP:CreateSimpleCommandsDerma()
  -- +/- CMDS
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd = vgui.Create("DPanel", self.MainPanel.RightPanel.CmdMenu)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd:Dock(FILL)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd:InvalidateParent(true)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(150,146,146))
  end

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer = vgui.Create("DPanel", self.MainPanel.RightPanel.CmdMenu.SimpleCmd )
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer:Dock(FILL)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(150,146,146))
  end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer:DockMargin(math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20),math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20),math.floor(self.MainPanel.LeftPanel:GetWide()* 1/20),math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))

  -- ???

  -- + COMMANDS
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer = vgui.Create("DPanel",self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer:SetHeight(math.floor((self.MainPanel.RightPanel.CmdMenu.SimpleCmd:GetTall() - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20) * 2 - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))/2) - 2)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer:DockMargin(0,0,0,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Paint = function() return end

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel = vgui.Create("DLabel", self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/10,0,self.MainPanel.LeftPanel:GetWide() * 1/10,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/40))
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetText("APPLY COMMANDS")
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetColor(Color(255,255,255))
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetFont("MediumTitle")
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetContentAlignment(5)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SizeToContents()
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll = vgui.Create("DScrollPanel",self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll:Dock(FILL)

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnUp.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnDown.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnGrip.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.SetUp = function (self, barSize, canvasSize)
    self.BarSize = barSize
    self.CanvasSize = math.max(canvasSize - barSize, 1)
    self:SetEnabled(true)
    self:InvalidateLayout()
  end

  for _,command in ipairs(self.SimpleCommands) do

  	local commandButtonPlus = vgui.Create( "DButton", self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll)
    commandButtonPlus:Dock(TOP)
    commandButtonPlus:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/7 + self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar:GetWide(),0,self.MainPanel.LeftPanel:GetWide() * 1/7,0)
    commandButtonPlus:SetText("+" .. command.cmd)
    commandButtonPlus:SetColor(Color(50,49,49))
    commandButtonPlus:SetFont("SmallTitle")
    commandButtonPlus:SizeToContents()

    commandButtonPlus.CmdArray = command

    commandButtonPlus.DoClick = function()


      self:AddCommandToQueue({cmd = commandButtonPlus:GetText(), args = ""})

    end

  end

  -- - COMMANDS

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer = vgui.Create("DPanel",self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer:SetHeight(math.floor((self.MainPanel.RightPanel.CmdMenu.SimpleCmd:GetTall() - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20) * 2 - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))/2) - 2)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer:DockMargin(0,0,0,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Paint = function()end

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel = vgui.Create("DLabel", self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/10,0,self.MainPanel.LeftPanel:GetWide() * 1/10,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/40))
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel:SetText("REMOVE COMMANDS")
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel:SetColor(Color(255,255,255))
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel:SetFont("MediumTitle")
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel:SetContentAlignment(5)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel:SizeToContents()
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.CategoryLabel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll = vgui.Create("DScrollPanel",self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll:Dock(FILL)

  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll.VBar.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll.VBar.btnUp.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll.VBar.btnDown.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll.VBar.btnGrip.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll.VBar.SetUp = function (self, barSize, canvasSize)
    self.BarSize = barSize
    self.CanvasSize = math.max(canvasSize - barSize, 1)
    self:SetEnabled(true)
    self:InvalidateLayout()
  end

  for _,command in ipairs(self.SimpleCommands) do

    local commandButtonMinus = vgui.Create( "DButton", self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll)
    commandButtonMinus:Dock(TOP)
    commandButtonMinus:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/7 + self.MainPanel.RightPanel.CmdMenu.SimpleCmd.CommandsContainer.MinusCommandsContainer.Scroll.VBar:GetWide(),0,self.MainPanel.LeftPanel:GetWide() * 1/7,0)
    commandButtonMinus:SetText("-" .. command.cmd)
    commandButtonMinus:SetColor(Color(50,49,49))
    commandButtonMinus:SetFont("SmallTitle")
    commandButtonMinus:SizeToContents()

    commandButtonMinus.CmdArray = command

    commandButtonMinus.DoClick = function()

      local commandButton = vgui.Create("DButton",self.MainPanel.RightPanel.CmdListContainer)
      commandButton:Dock(TOP)
      commandButton:SetText(commandButtonMinus:GetText())
      commandButton:SetColor(Color(50,49,49))
      commandButton:SetFont("MediumTitle")
      commandButton:SizeToContents()

      if not self.IndexCounter then self.IndexCounter = 0 end
      commandButton.Index = self.IndexCounter
      self.IndexCounter = self.IndexCounter + 1
      commandButton.DoClick = function()
        net.Start("CMDGUN_REMOVE_COMMAND")
          net.WriteEntity(self.Owner)
          net.WriteDouble(commandButton.Index)
        net.SendToServer()
        commandButton:Remove()
      end

      local commandArray
      if command.needArg then
        Derma_StringRequest(
        	"Argument(s)",
        	"Enter argument(s) below :",
        	"",
        	function( text ) commandArray = {cmd = commandButtonMinus:GetText(), args = text} end,
        	function( text ) commandArray = {cmd = commandButtonMinus:GetText(), args = ""} end)
      else
        commandArray = {cmd = commandButtonMinus:GetText(), args = ""}
      end

      net.Start("CMDGUN_SEND_NEW_COMMAND")
        net.WriteEntity(self.Owner)
        net.WriteTable(commandArray)
        net.WriteDouble(commandButton.Index)
      net.SendToServer()
    end

  end

end


function SWEP:CreateMediumCommandsDerma()
  -- +/- CMDS
  self.MainPanel.RightPanel.CmdMenu.MediumCmd = vgui.Create("DPanel", self.MainPanel.RightPanel.CmdMenu)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd:Dock(FILL)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd:InvalidateParent(true)
  print("tallz = " .. self.MainPanel.RightPanel.CmdMenu.MediumCmd:GetTall())
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(150,146,146))
  end

  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer = vgui.Create("DPanel", self.MainPanel.RightPanel.CmdMenu.MediumCmd )
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer:Dock(FILL)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(150,146,146))
  end
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer:DockMargin(math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20),math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20),math.floor(self.MainPanel.LeftPanel:GetWide()* 1/20),math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))

  -- ???

  -- + COMMANDS
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer = vgui.Create("DPanel",self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer:SetHeight(math.floor((self.MainPanel.RightPanel.CmdMenu.MediumCmd:GetTall() - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20) * 2 - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))/2) - 2)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer:DockMargin(0,0,0,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Paint = function() return end

  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel = vgui.Create("DLabel", self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/10,0,self.MainPanel.LeftPanel:GetWide() * 1/10,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/40))
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetText("EXECUTE COMMANDS")
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetColor(Color(255,255,255))
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetFont("MediumTitle")
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetContentAlignment(5)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SizeToContents()
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end

  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll = vgui.Create("DScrollPanel",self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll:Dock(FILL)

  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnUp.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnDown.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnGrip.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.SetUp = function (self, barSize, canvasSize)
    self.BarSize = barSize
    self.CanvasSize = math.max(canvasSize - barSize, 1)
    self:SetEnabled(true)
    self:InvalidateLayout()
  end

  for _,command in ipairs(self.MediumCommands) do

    local commandButtonPlus = vgui.Create( "DButton", self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll)
    commandButtonPlus:Dock(TOP)
    commandButtonPlus:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/7 + self.MainPanel.RightPanel.CmdMenu.MediumCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar:GetWide(),0,self.MainPanel.LeftPanel:GetWide() * 1/7,0)
    commandButtonPlus:SetText(command.cmd)
    commandButtonPlus:SetColor(Color(50,49,49))
    commandButtonPlus:SetFont("SmallTitle")
    commandButtonPlus:SizeToContents()

    commandButtonPlus.DoClick = function()

      local commandArray
      if command.needArg then
        Derma_StringRequest(
        	"Argument(s)",
        	"Enter argument(s) below :",
        	"",
        	function( text )
            if text == "" then return end
            self:AddCommandToQueue({cmd = commandButtonPlus:GetText(), args = text})
          end,
        	function( text ) return end
         )
      else
        self:AddCommandToQueue({cmd = commandButtonPlus:GetText(), args = ""})
      end

    end

  end

end

function SWEP:CreateCancerCommandsDerma()
  self.MainPanel.RightPanel.CmdMenu.CancerCmd = vgui.Create("DPanel", self.MainPanel.RightPanel.CmdMenu)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd:Dock(FILL)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd:InvalidateParent(true)
  print("tallz = " .. self.MainPanel.RightPanel.CmdMenu.CancerCmd:GetTall())
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(150,146,146))
  end

  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer = vgui.Create("DPanel", self.MainPanel.RightPanel.CmdMenu.CancerCmd )
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer:Dock(FILL)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(150,146,146))
  end
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer:DockMargin(math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20),math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20),math.floor(self.MainPanel.LeftPanel:GetWide()* 1/20),math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))

  -- ???

  -- + COMMANDS
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer = vgui.Create("DPanel",self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer:SetHeight(math.floor((self.MainPanel.RightPanel.CmdMenu.CancerCmd:GetTall() - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20) * 2 - math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))/2) - 2)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer:DockMargin(0,0,0,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/20))
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Paint = function() return end

  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel = vgui.Create("DLabel", self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/10,0,self.MainPanel.LeftPanel:GetWide() * 1/10,math.floor(self.MainPanel.LeftPanel:GetWide() * 1/40))
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetText("EXECUTE LUA")
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetColor(Color(255,255,255))
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetFont("MediumTitle")
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SetContentAlignment(5)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel:SizeToContents()
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.CategoryLabel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end

  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll = vgui.Create("DScrollPanel",self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer)
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll:Dock(FILL)

  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnUp.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnDown.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.btnGrip.Paint = function() end
  self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar.SetUp = function (self, barSize, canvasSize)
    self.BarSize = barSize
    self.CanvasSize = math.max(canvasSize - barSize, 1)
    self:SetEnabled(true)
    self:InvalidateLayout()
  end

  for _,command in ipairs(self.CancerCommands) do

    local commandButtonPlus = vgui.Create( "DButton", self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll)
    commandButtonPlus:Dock(TOP)
    commandButtonPlus:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/7 + self.MainPanel.RightPanel.CmdMenu.CancerCmd.CommandsContainer.PlusCommandsContainer.Scroll.VBar:GetWide(),0,self.MainPanel.LeftPanel:GetWide() * 1/7,0)
    commandButtonPlus:SetText(command.cmd)
    commandButtonPlus:SetColor(Color(50,49,49))
    commandButtonPlus:SetFont("SmallTitle")
    commandButtonPlus:SizeToContents()

    commandButtonPlus.DoClick = function()
      local tips
      if command.Tips then tips = command.Tips .. "\n" else tips = "" end
      if command.needArg then
        Derma_StringRequest(
        	"Argument(s)",
        	tips.."Enter argument(s) below :",
        	"",
        	function( text )
            if text == "" then return end
            command.Args = text
            self:AddCommandToQueue(command)
          end,
        	function( text ) return end
         )
      else
        self:AddCommandToQueue(command)
      end

    end

  end
end

function SWEP:CreateDerma()

  local sw,sh = ScrW(),ScrH()

  self.MainFrame = vgui.Create("DFrame")
  self.MainFrame:SetSize(sw, sh)
  self.MainFrame:Center()
  self.MainFrame:SetTitle( "" )
  self.MainFrame:SetDraggable(false)
  self.MainFrame:ShowCloseButton(false)
  self.MainFrame:SetDeleteOnClose(false)
  self.MainFrame:MakePopup(true)
  self.MainFrame.Paint = function() end

  self.MainFrame.IsLoaded = false

  self.MainFrame.Think = function()
    if not self.MainFrame then return end
    if input.IsMouseDown(MOUSE_RIGHT) and not self.RightClickDown and self.MainFrame.IsLoaded then
      self.RightClickDown = true

      timer.Simple(0.5, function() self.RightClickDown = false end)

      if self.MainFrame:IsVisible() then
           self.MainFrame.IsLoaded = false
           self.MainFrame:Hide()
           --self.MainFrame:Remove()
          -- self.MainFrame = nil

      end

    end
  end

  local mainPanelW, mainPanelH = sw - math.floor(sw*1/4) * 2, sh - math.floor(sh*1/8) * 2
  -- MAIN PANEL
  self.MainPanel = vgui.Create("DPanel",self.MainFrame)
  self.MainPanel:Dock(LEFT)
  self.MainPanel:SetWidth(mainPanelW)
  self.MainPanel:DockMargin(math.floor(sw*1/4),math.floor(sh*1/8),math.floor(sw*1/4),math.floor(sh*1/8))

  self.MainPanel.Paint = function(pnl,w,h)end

  -- LEFT PANEL
  self.MainPanel.LeftPanel = vgui.Create("DPanel", self.MainPanel)
  self.MainPanel.LeftPanel:Dock(LEFT)
  self.MainPanel.LeftPanel:SetWidth(mainPanelW * 1/3)
  self.MainPanel.LeftPanel:DockMargin(0,0,mainPanelW * 1/100,0)
  self.MainPanel.LeftPanel.Paint = function(pnl,w,h)end

  self.MainPanel.LeftPanel.PseudoLabel = vgui.Create("DLabel", self.MainPanel.LeftPanel)
  self.MainPanel.LeftPanel.PseudoLabel:Dock(TOP)
  self.MainPanel.LeftPanel.PseudoLabel:SetHeight(math.floor(mainPanelH * 1/15))
  self.MainPanel.LeftPanel.PseudoLabel:SetContentAlignment(5)
  self.MainPanel.LeftPanel.PseudoLabel:SetText("NO PLAYER SELECTED")
  self.MainPanel.LeftPanel.PseudoLabel:SetColor(Color(255,255,255))
  self.MainPanel.LeftPanel.PseudoLabel:SetFont("BigTitle")
  self.MainPanel.LeftPanel.PseudoLabel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end

  self.MainPanel.LeftPanel.ModelViewerPanel = vgui.Create("DPanel", self.MainPanel.LeftPanel)
  self.MainPanel.LeftPanel.ModelViewerPanel:Dock(TOP)
  self.MainPanel.LeftPanel.ModelViewerPanel:SetHeight(math.floor(mainPanelH * 3/4) - self.MainPanel.LeftPanel.PseudoLabel:GetTall())
  self.MainPanel.LeftPanel.ModelViewerPanel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
    draw.RoundedBox(0,math.floor(w*1/80),0,w - math.floor(w*1/80) * 2,h,Color(150,146,146))
  end

  self.MainPanel.LeftPanel.ModelViewerPanel.ModelViewer = vgui.Create("DModelPanel",self.MainPanel.LeftPanel.ModelViewerPanel)
  self.MainPanel.LeftPanel.ModelViewerPanel.ModelViewer:Dock(FILL)
  self.MainPanel.LeftPanel.ModelViewerPanel.ModelViewer.LayoutEntity = function() return end

  self.MainPanel.LeftPanel.PseudoContainer = vgui.Create("DPanel", self.MainPanel.LeftPanel)
  self.MainPanel.LeftPanel.PseudoContainer:Dock(FILL)
  self.MainPanel.LeftPanel.PseudoContainer:DockPadding(0,0,0,10)
  self.MainPanel.LeftPanel.PseudoContainer.Paint = function(pnl,w,h)
      draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
      draw.RoundedBox(0,math.floor(w*1/80),0,w - math.floor(w*1/80) * 2,h - math.floor(w*1/80),Color(150,146,146))
    end

  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel = vgui.Create("DLabel", self.MainPanel.LeftPanel.PseudoContainer)
  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel:Dock(TOP)
  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel:SetHeight(mainPanelH * 1/30)
  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel:SetText("PLAYERS LIST")
  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel:SetColor(Color(255,255,255))
  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel:SetFont("MediumTitle")
  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel:SetContentAlignment(5)
  self.MainPanel.LeftPanel.PseudoContainer.PlayersLabel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end

  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector = vgui.Create("DScrollPanel", self.MainPanel.LeftPanel.PseudoContainer)
  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector:Dock(FILL)
  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector:DockPadding(0,0,0,self.MainPanel.LeftPanel:GetWide() * 1/60)

  -- scroll bar
  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector.VBar.Paint = function() end
  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector.VBar.btnUp.Paint = function() end
  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector.VBar.btnDown.Paint = function() end
  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector.VBar.btnGrip.Paint = function() end
  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector.VBar.SetUp = function (self, barSize, canvasSize)
    self.BarSize = barSize
    self.CanvasSize = math.max(canvasSize - barSize, 1)
    self:SetEnabled(true)
    self:InvalidateLayout()
  end
  -- scroll bar

  self.MainPanel.LeftPanel.PseudoContainer.PseudoSelector.Paint = function(pnl,w,h)end

  self:CreatePlayerList()

  -- RIGHT PANEL
  self.MainPanel.RightPanel = vgui.Create("DPanel", self.MainPanel)
  self.MainPanel.RightPanel:Dock(FILL)
  self.MainPanel.RightPanel.Paint = function(pnl,w,h)end

  self.MainPanel.RightPanel.CmdMenu = vgui.Create("DPropertySheet", self.MainPanel.RightPanel)
  self.MainPanel.RightPanel.CmdMenu:Dock(TOP)
  self.MainPanel.RightPanel.CmdMenu:SetHeight(math.floor(mainPanelH * 3/4))
  self.MainPanel.RightPanel.CmdMenu.Paint = function(pnl,w,h)end

  self.MainPanel.RightPanel.CmdQueueLabel = vgui.Create("DLabel", self.MainPanel.RightPanel)
  self.MainPanel.RightPanel.CmdQueueLabel:Dock(TOP)
  self.MainPanel.RightPanel.CmdQueueLabel:SetHeight(math.floor(mainPanelH * 1/30))
  self.MainPanel.RightPanel.CmdQueueLabel:SetText("Commands queue")
  self.MainPanel.RightPanel.CmdQueueLabel:SetColor(Color(255,255,255))
  self.MainPanel.RightPanel.CmdQueueLabel:SetFont("MediumTitle")
  self.MainPanel.RightPanel.CmdQueueLabel:SetContentAlignment(5)
  self.MainPanel.RightPanel.CmdQueueLabel.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end

  self.MainPanel.RightPanel.CmdListContainer = vgui.Create("DScrollPanel", self.MainPanel.RightPanel)
  self.MainPanel.RightPanel.CmdListContainer:Dock(FILL)
  self.MainPanel.RightPanel.CmdListContainer.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(150,146,146))
  end


  self.MainPanel.RightPanel.ClearQueueButton = vgui.Create("DButton", self.MainPanel.RightPanel)
  self.MainPanel.RightPanel.ClearQueueButton:Dock(BOTTOM)
  self.MainPanel.RightPanel.ClearQueueButton:SetHeight(mainPanelH * 1/30)
  --self.MainPanel.RightPanel.ClearQueueButton:DockMargin(self.MainPanel.LeftPanel:GetWide() * 1/40,self.MainPanel.LeftPanel:GetWide()* 1/40,self.MainPanel.LeftPanel:GetWide()* 1/40,self.MainPanel.LeftPanel:GetWide()* 1/40)
  self.MainPanel.RightPanel.ClearQueueButton:SetText("Clear queue")
  self.MainPanel.RightPanel.ClearQueueButton:SetColor(Color(255,255,255))
  self.MainPanel.RightPanel.ClearQueueButton:SetFont("SmallTitle")
  self.MainPanel.RightPanel.ClearQueueButton.Paint = function(pnl,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(50,49,49))
  end
  self.MainPanel.RightPanel.ClearQueueButton.DoClick = function()
    net.Start("CMDGUN_CLEAN_COMMANDS_QUEUE")
      net.WriteEntity(self.Owner)
    net.SendToServer()
    self.MainPanel.RightPanel.CmdListContainer:Clear()
  end

  -- TABS

  -- + -

  if not table.HasValue(self.SimpleCommandsWhiteList, self.Owner:SteamID()) then return end
  self:CreateSimpleCommandsDerma()

  self.MainPanel.RightPanel.CmdMenu:AddSheet("+/- - CMD", self.MainPanel.RightPanel.CmdMenu.SimpleCmd, "icon16/cross.png")

  -- medium

  if not table.HasValue(self.MediumCommandsWhiteList, self.Owner:SteamID()) then return end
  self:CreateMediumCommandsDerma()

  self.MainPanel.RightPanel.CmdMenu:AddSheet("Medium CMD", self.MainPanel.RightPanel.CmdMenu.MediumCmd, "icon16/application_osx_terminal.png")
  --self.MainPanel.RightPanel.CmdMenu:AddSheet("+/- - CMD", self.MainPanel.RightPanel.CmdMenu.SimpleCmd, "icon16/cross.png")
  --self.MainPanel.RightPanel.CmdMenu:AddSheet("+/- - CMD", self.MainPanel.RightPanel.CmdMenu.SimpleCmd, "icon16/cross.png")

  if not table.HasValue(self.CancerCommandsWhiteList, self.Owner:SteamID()) then return end

  self:CreateCancerCommandsDerma()

  self.MainPanel.RightPanel.CmdMenu:AddSheet("Cancer CMD", self.MainPanel.RightPanel.CmdMenu.CancerCmd, "icon16/bug.png")


end

function SWEP:SecondaryAttack()
  if not IsFirstTimePredicted() then return end
  if not table.HasValue(self.WhiteList,self.Owner:SteamID()) then self.Owner:ChatPrint("You are NOT in the whitelist...") return end

  if SERVER then return end

  if self.MainFrame and self.MainFrame:IsVisible() then return end

  if not self.MainFrame then
    self:CreateDerma()
  elseif self.MainFrame and not self.MainFrame:IsVisible() then
    self.MainFrame:Show()
    self:CreatePlayerList()
  end

  timer.Simple(0.1,function() self.MainFrame.IsLoaded = true end)


end

function SWEP:Reload()

end

function SWEP:OnRemove()
  if not self.Owner then return end
  net.Start("CMDGUN_RESET_VARS")
    net.WriteEntity(self.Owner)
  net.SendToServer()
end

function SWEP:Initialize()

end

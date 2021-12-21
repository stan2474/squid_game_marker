--[[
impossible squid game marker
credits to kitfisco for setrawproperty implementation in lua and iaying for his Sit bypass
this code is as optimized it can be
]]

local tbl = {}

local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
   if not checkcaller() and getnamecallmethod() == "FireServer" and Self.Name == "RemoteEvent" and game.IsA(getcallingscript().Parent, "ScreenGui") then
       return wait(9e9)
   end
   return OldNamecall(Self, ...)
end)


--picosecond optimizations op!!!!
local game = game
local string = string

local GetService = game.GetService
local IsA = game.IsA
local Workspace = GetService(game, "Workspace")
local GetDescendants = game.GetDescendants
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass

local Guess = Workspace.Guess
local GetDescTable = GetDescendants(Workspace.Guess)
local strFind = string.find
local tonum = tonumber
local hidesel = syn.protect_gui or gethui or get_hidden_gui

local function passCheck(ist)



    return true 
end

for troll=1, #GetDescTable do
       local v = GetDescTable[troll]
       if IsA(v, "Part") and FindFirstChildWhichIsA(v, "TouchTransmitter") and passCheck(v.Name) then
           FindFirstChildWhichIsA(v, "TouchTransmitter"):Destroy()
           v.Touched.Connect(v.Touched, function(part)
               local char = FindFirstAncestorOfClass(part, "Model")
               local hum = char.Humanoid
               task.wait(0.9)
               if hum.Health > 0 and not table.find(tbl, v) then
                 if (char.PrimaryPart.Position - v.Position).magnitude > 0.8 then
                     local selbox = Instance.new("SelectionBox")
                     selbox.Adornee = v
                     hidesel(selbox)
                     selbox.Parent = GetService(game, "CoreGui")
                     table.insert(tbl, v)
               end
           end
       end)
   end
end

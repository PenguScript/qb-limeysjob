print "qb-limeysjob made by PenguScripts using the Limeys MLO"
print "version 1.1"

local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("qb-limeysjob:bill:player")
AddEventHandler("qb-limeysjob:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == Config.JobName then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

----DRINKS------------------------------------------------


QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientcherrydrink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cherry = Ply.Functions.GetItemByName("cherry")
    local glass = Ply.Functions.GetItemByName("drink-glass")
    if cherry ~= nil and glass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientlemondrink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lemon = Ply.Functions.GetItemByName("lemon")
    local glass = Ply.Functions.GetItemByName("drink-glass")
    if lemon ~= nil and glass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientlimedrink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lime = Ply.Functions.GetItemByName("lime")
    local glass = Ply.Functions.GetItemByName("drink-glass")
    if lime ~= nil and glass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientorangedrink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local watermelon = Ply.Functions.GetItemByName("orange")
    local glass = Ply.Functions.GetItemByName("drink-glass")
    if watermelon ~= nil and glass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientwatermelondrink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local watermelon = Ply.Functions.GetItemByName("watermelon")
    local glass = Ply.Functions.GetItemByName("drink-glass")
    if watermelon ~= nil and glass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)



-----COCKTAIL----------------------------------------------------

QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientapplecocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local apple = Ply.Functions.GetItemByName("apple")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and apple ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientbananacocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local banana = Ply.Functions.GetItemByName("banana")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and banana ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientcherrycocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local cherry = Ply.Functions.GetItemByName("cherry")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and cherry ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientkiwicocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local kiwi = Ply.Functions.GetItemByName("kiwi")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and kiwi ~= nil and whiskey ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-limeysjob:server:get:ingredientparadisecocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("cocktailglass")
    local apple = Ply.Functions.GetItemByName("apple")
    local cherry = Ply.Functions.GetItemByName("cherry")
    local kiwi = Ply.Functions.GetItemByName("kiwi")
    local banana = Ply.Functions.GetItemByName("banana")
    local watermelon = Ply.Functions.GetItemByName("watermelon")
    local orange = Ply.Functions.GetItemByName("orange")
    local lemon = Ply.Functions.GetItemByName("lemon")
    local lime = Ply.Functions.GetItemByName("lime")
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    if glass ~= nil and cherry ~= nil and apple ~= nil and kiwi ~= nil and banana ~= nil and watermelon ~= nil and orange  ~= nil and lemon ~= nil and lime ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- ITEM ADD/REMOVE FUNCTIONS

RegisterNetEvent('qb-limeysjob:server:CherryCocktail', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('cocktailglass', 1)
    plr.Functions.RemoveItem('whiskey', 1)
    plr.Functions.RemoveItem('cherry', 1)
    plr.Functions.AddItem('cherrycocktail', 1)
end)
RegisterNetEvent('qb-limeysjob:server:AppleCocktail', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('cocktailglass', 1)
    plr.Functions.RemoveItem('whiskey', 1)
    plr.Functions.RemoveItem('apple', 1)
    plr.Functions.AddItem('applecocktail', 1)
end)
RegisterNetEvent('qb-limeysjob:server:BananaCocktail', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('cocktailglass', 1)
    plr.Functions.RemoveItem('whiskey', 1)
    plr.Functions.RemoveItem('banana', 1)
    plr.Functions.AddItem('bananacocktail', 1)
end)
RegisterNetEvent('qb-limeysjob:server:KiwiCocktail', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('cocktailglass', 1)
    plr.Functions.RemoveItem('whiskey', 1)
    plr.Functions.RemoveItem('kiwi', 1)
    plr.Functions.AddItem('kiwicocktail', 1)
end)
RegisterNetEvent('qb-limeysjob:server:ParadiseCocktail', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('cocktailglass', 1)
    plr.Functions.RemoveItem('apple', 1)
    plr.Functions.RemoveItem('cherry', 1)
    plr.Functions.RemoveItem('kiwi', 1)
    plr.Functions.RemoveItem('banana', 1)
    plr.Functions.RemoveItem('watermelonslice', 1)
    plr.Functions.RemoveItem('orange', 1)
    plr.Functions.RemoveItem('lemon', 1)
    plr.Functions.RemoveItem('lime', 1)
    plr.Functions.RemoveItem('whiskey', 1)
    plr.Functions.AddItem('paradisecocktail', 1)
end)
RegisterNetEvent('qb-limeysjob:server:CherryDrink', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('drink-glass', 1)
    plr.Functions.RemoveItem('cherry', 1)
    plr.Functions.AddItem('cherrydrink', 1)
end)
RegisterNetEvent('qb-limeysjob:server:LemonDrink', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('drink-glass', 1)
    plr.Functions.RemoveItem('lemon', 1)
    plr.Functions.AddItem('lemondrink', 1)
end)
RegisterNetEvent('qb-limeysjob:server:LimeDrink', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('drink-glass', 1)
    plr.Functions.RemoveItem('lime', 1)
    plr.Functions.AddItem('limedrink', 1)
end)
RegisterNetEvent('qb-limeysjob:server:OrangeDrink', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('drink-glass', 1)
    plr.Functions.RemoveItem('orange', 1)
    plr.Functions.AddItem('orangedrink', 1)
end)
RegisterNetEvent('qb-limeysjob:server:CherryDrink', function()
    local src = source
    local plr = QBCore.Functions.GetPlayer(src)
    plr.Functions.RemoveItem('drink-glass', 1)
    plr.Functions.RemoveItem('watermelonslice', 1)
    plr.Functions.AddItem('watermelondrink', 1)
end)
QBCore.Functions.CreateUseableItem('watermelon', function(source)
    local plr = QBCore.Functions.GetPlayer(source)
    plr.Functions.RemoveItem('watermelon', 1)
    plr.Functions.AddItem('watermelonslice', math.random(10,16))
    TriggerEvent('qb-limeysjob:WatermelonSlice')
end)

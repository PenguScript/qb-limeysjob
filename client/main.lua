local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    Limeys = AddBlipForCoord(290.06, -961.77, 29.42)
    SetBlipSprite (Limeys, 93)
    SetBlipDisplay(Limeys, 4)
    SetBlipScale  (Limeys, 0.7)
    SetBlipAsShortRange(Limeys, true)
    SetBlipColour(Limeys, 46)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Limey's")
    EndTextCommandSetBlipName(Limeys)
end) 


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "limeys" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

RegisterNetEvent("qb-limeysjob:DutyB")
AddEventHandler("qb-limeysjob:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

-----Restaurant Stuff

RegisterNetEvent("qb-limeysjob:Tray1")
AddEventHandler("qb-limeysjob:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "LimeysTray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "LimeysTray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-limeysjob:Tray2")
AddEventHandler("qb-limeysjob:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "LimeysTray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "LimeysTray2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-limeysjob:Cabinet1")
AddEventHandler("qb-limeysjob:Cabinet1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "limeyscabinet1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "limeyscabinet1", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-limeysjob:Cabinet2")
AddEventHandler("qb-limeysjob:Cabinet2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "limeyscabinet2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "limeyscabinet2", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-limeysjob:Cabinet3")
AddEventHandler("qb-limeysjob:Cabinet3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "limeyscabinet3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "limeyscabinet3", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-limeysjob:Fridge")
AddEventHandler("qb-limeysjob:Fridge", function()
    TriggerEvent("inventory:client:SetCurrentStash", "winefridge")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "fridge", {
        maxweight = 250000,
        slots = 40,
    })
end)


---drinks menu--------------------
RegisterNetEvent("qb-limeysjob:CherryCocktail")
AddEventHandler("qb-limeysjob:CherryCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientcherrycocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Cherry Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cherry", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "cherrycocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherry"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherrycocktail"], "add")
                    			QBCore.Functions.Notify("You made a Cherry Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:AppleCocktail")
AddEventHandler("qb-limeysjob:AppleCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientapplecocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making an Apple Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "applecocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["applecocktail"], "add")
                    			QBCore.Functions.Notify("You made an Apple Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:BananaCocktail")
AddEventHandler("qb-limeysjob:BananaCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientbananacocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Banana Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "banana", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "bananacocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["banana"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bananacocktail"], "add")
                    			QBCore.Functions.Notify("You made a Banana Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:KiwiCocktail")
AddEventHandler("qb-limeysjob:KiwiCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientkiwicocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Kiwi Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "kiwi", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "kiwicocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwi"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwicocktail"], "add")
                    			QBCore.Functions.Notify("You made a Kiwi Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:ParadiseCocktail")
AddEventHandler("qb-limeysjob:ParadiseCocktail", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientparadisecocktail', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Paradise Cocktail..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocktailglass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cherry", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "kiwi", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "banana", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "watermelon", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "orange", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "lemon", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "lime", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "paradisecocktail", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocktailglass"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherry"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kiwi"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["banana"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["watermelon"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["orange"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lemon"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lime"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["paradisecocktail"], "add")
                    			QBCore.Functions.Notify("You made a Paradise Cocktail", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:CherryDrink")
AddEventHandler("qb-limeysjob:CherryDrink", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientcherrydrink', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Cherry Drink..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "drink-glass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cherry", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "cherrydrink", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drink-glass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherry"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cherrydrink"], "add")
                    			QBCore.Functions.Notify("You made a Cherry Drink", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:LemonDrink")
AddEventHandler("qb-limeysjob:LemonDrink", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientlemondrink', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Rip-off Lemonade..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "drink-glass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "lemon", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "lemondrink", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drink-glass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lemon"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lemondrink"], "add")
                    			QBCore.Functions.Notify("You made Rip-off Lemonade", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:LimeDrink")
AddEventHandler("qb-limeysjob:LimeDrink", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientlimedrink', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Lime Drink..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "drink-glass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "lime", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "limedrink", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drink-glass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lime"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["limedrink"], "add")
                    			QBCore.Functions.Notify("You made a Lime Drink", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:OrangeDrink")
AddEventHandler("qb-limeysjob:OrangeDrink", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientorangedrink', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Orange Drink..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "drink-glass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "orange", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "orangedrink", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drink-glass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["orange"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["orangedrink"], "add")
                    			QBCore.Functions.Notify("You made a Orange Drink", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
RegisterNetEvent("qb-limeysjob:WatermelonDrink")
AddEventHandler("qb-limeysjob:WatermelonDrink", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-limeysjob:server:get:ingredientwatermelondrink', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Watermelon Drink..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "drink-glass", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "watermelon", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "watermelondrink", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drink-glass"], "remove")
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["watermelon"], "remove")
								TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["watermelondrink"], "add")
                    			QBCore.Functions.Notify("You made a Watermelon Drink", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)











RegisterNetEvent("qb-limeysjob:shop")
AddEventHandler("qb-limeysjob:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "limeys", Config.Items)
end)

RegisterNetEvent("qb-limeysjob:candyshop")
AddEventHandler("qb-limeysjob:candyshop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "limeyscandy", Config.CandyItems)
end)

RegisterNetEvent("qb-limeysjob:donutshop")
AddEventHandler("qb-limeysjob:donutshop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "limeysdonuts", Config.DonutItems)
end)

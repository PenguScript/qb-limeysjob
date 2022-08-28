

Discord - https://discord.gg/PkJGQ6EdZp

# This is a job for the Limeys MLO
> (https://www.gta5-mods.com/maps/mlo-limeys-juice-bar-fivem-add-on-sp)


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-policejob - https://github.com/qbcore-framework/qb-policejob
> IF YOU USE A DIFFERENT POLICE ALERT SYSTEM PLEASE LET ME KNOW SO THAT I COULD CHANGE IT! [Support](https://discord.gg/PkJGQ6EdZp)

## Add to qb-smallresources/server/consumeables.lua. 
```
--drinks
QBCore.Functions.CreateUseableItem("cherrycocktail", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("applecocktail", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bananacocktail", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cherrydrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("kiwicocktail", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("lemondrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("limedrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("orangedrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("paradisecocktail", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("watermelondrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("limeysgum", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("limeyschocolate", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("limeyschocolate2", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("limeysdonut", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("limeysdonut2", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
```



## Add to qb-smallresources/config.lua
```
Consumeables = {

--donuts
	["limeysdonut"] = math.random(10, 25)
    ["limeysdonut2"] = math.random(10, 25)
--candies
	["limeysgum"] = math.random(10, 25)
    ["limeyschocolate"] = math.random(10, 25)
    ["limeyschocolate2"] = math.random(10, 25)

--drink
    ["cherrydrink"] = math.random(55, 80),
    ["lemondrink"] = math.random(55, 80),
    ["limedrink"] = math.random(55, 80),
    ["orangedrink"] = math.random(55, 80),
    ["watermelondrink"] = math.random(55, 80),


--alcohol
    ["paradisecocktail"] = math.random(75, 100),
    ["cherrycocktail"] = math.random(50, 75),
    ["applecocktail"] = math.random(50, 75),
    ["bananacocktail"] = math.random(50, 75),
    ["kiwicocktail"] = math.random(50, 75),    

```

## Insert into @qb-core/shared/items.lua 

```
QBShared.Items = {
--qb-limeysjob
	
	--drinks
    ['limeysdonut'] 				 	 = {['name'] = 'limeysdonut', 			  	  	['label'] = 'Strawberry Donut', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'limeysdonut2.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Strawberry Donut!'},
    ['limeysdonut2'] 				 	 = {['name'] = 'limeysdonut2', 			  	  	['label'] = 'Chocolate Donut', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'limeysdonut2.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Chocolate Donut!'},
    ['limeysgum'] 				 	 = {['name'] = 'limeysgum', 			  	  	['label'] = 'Trident Gum', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'limeysgum.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Chewy! Minty! Fresh!'},
    ['limeyschocolate'] 				 	 = {['name'] = 'limeyschocolate', 			  	  	['label'] = 'Nestle Extrafino Chocolate', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'limeyschocolate.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Mmmmmm Chocolate!'},
    ['limeyschocolate2'] 				 	 = {['name'] = 'limeyschocolate2', 			  	  	['label'] = 'Cadbury Dairy Milk Chocolate', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'limeyschocolate2.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cadbury Chocolate!'},
	['cherrydrink'] 				 	 = {['name'] = 'cherrydrink', 			  	  	['label'] = 'Cherry Drink', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cherrydrink.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cherries!'},
	['lemondrink'] 				 	 = {['name'] = 'lemondrink', 			  	     	['label'] = 'Lemon Drink', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lemondrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Rip-off Lemonade'},
	['limedrink'] 				 	 = {['name'] = 'limedrink', 			  	     	['label'] = 'Lime Drink', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'limedrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Limes...'},
	['orangedrink'] 				 	 = {['name'] = 'orangedrink', 			     	['label'] = 'Orange Drink', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'orangedrink.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A fancy orange juice...'},
	['watermelondrink'] 				 	 = {['name'] = 'watermelondrink', 			  	    	['label'] = 'Watermelon Drink', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'watermelondrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Watermelon Drink.'},
	['paradisecocktail'] 				     	 = {['name'] = 'paradisecocktail', 			    	  	['label'] = 'Paradise Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'paradisecocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Living in paradise!'},
	['cherrycocktail'] 				     	 = {['name'] = 'cherrycocktail', 			    	  	['label'] = 'Cherry Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cherrycocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cherries.. But with whiskey'},
	['applecocktail'] 				     	 = {['name'] = 'applecocktail', 			    	  	['label'] = 'Apple Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'applecocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Rumor has it that Issac Newton made this.'},
	['bananacocktail'] 				     	 = {['name'] = 'bananacocktail', 			    	  	['label'] = 'Banana Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bananacocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The Minions made this.'},
	['kiwicocktail'] 				     	 = {['name'] = 'kiwicocktail', 			    	  	['label'] = 'Kiwi Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'kiwicocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Kiwi.'},
	['drink-glass'] 				 = {['name'] = 'drink-glass', 			  	  	['label'] = 'Glass', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drink-glass.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Glass made for normal drinks'},
	['cocktailglass'] 				 = {['name'] = 'cocktailglass', 			  	  	['label'] = 'Cocktail Glass', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cocktailglass.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Glass made for cocktails!'},
	['apple'] 		    	 = {['name'] = 'apple', 			   	['label'] = 'Apple',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'apple.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['banana'] 		    	 = {['name'] = 'banana', 			   	['label'] = 'Banana',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'banana.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['cherry'] 		    	 = {['name'] = 'cherry', 			   	['label'] = 'Cherry',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cherry.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['kiwi'] 		    	 = {['name'] = 'kiwi', 			   	['label'] = 'Kiwi',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'kiwi.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['lemon'] 		    	 = {['name'] = 'lemon', 			   	['label'] = 'Lemon',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lemon.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['lime'] 		    	 = {['name'] = 'lime', 			   	['label'] = 'Lime',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lime.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['orange'] 		    	 = {['name'] = 'orange', 			   	['label'] = 'Orange',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'orange.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['watermelon'] 		    	 = {['name'] = 'watermelon', 			   	['label'] = 'Watermelon',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'watermelon.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'a sliceable watermelon!'},
	['whiskey'] 		    	 = {['name'] = 'whiskey', 			   	['label'] = 'Whiskey',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'whiskey.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'This is not a bottle of booze!'},
	['watermelonslice'] 		    	 = {['name'] = 'watermelonslice', 			   	['label'] = 'Watermelon Slice',               	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'watermelonslice.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},

}

```

## Insert Contents of @limeysjob/Images into @qb-inventory/HTML/Images


## Insert into @qb-core/shared/jobs.lua 
```
QBShared.Jobs = {
    ["limeys"] = {
		label = "Limey\'s Juice Shop",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 75 --edit depending on your economy
            },
			['1'] = {
                name = "Worker",
                payment = 100 --edit depending on your economy
            },
            ['3'] = {
                name = "manager",
                payment = 150 --edit depending on your economy
            },
			['4'] = {
                name = "Owner",
                isboss = true,
                payment = 200 --edit depending on your economy
            },
        },
	},
}		
```

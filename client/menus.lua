local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = false
PlayerJob = {}

local onDuty = false

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("LimeysDuty", vector3(252.78, -1018.57, 29.46), 0.25, 0.3, {
		name = "LimeysDuty",
		heading = 132.0,
		debugPoly = Config.PolyZoneTest,
		minZ=29.465,
		maxZ=29.6,
	}, {
		options = {
		    {  
			event = "qb-limeysjob:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = Config.JobName,
		    },
		},
		distance = 1.5
	})  
    exports['qb-target']:AddBoxZone("LimeysTray1", vector3(252.98, -1023.48, 29.68), 0.5, 0.5, {
		name = "LimeysTray1",
		heading = 70.0,
		debugPoly = Config.PolyZoneTest,
		minZ=29.5,
		maxZ=29.7,
	}, {
		options = {
		    {
			event = "qb-limeysjob:Tray1",
			icon = "fas fa-box",
			label = "Tray 1",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("LimeysTray2", vector3(254.0, -1020.8, 29.61), 0.75, 0.35, {
		name = "LimeysTray2",
		heading = 160.0,
		debugPoly = Config.PolyZoneTest,
		minZ=29.5,
		maxZ=29.62,
	}, {
		options = {
		    {
			event = "qb-limeysjob:Tray2",
			icon = "fas fa-box",
			label = "Tray 2",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("LimeysCustomerMenu", vector3(252.90, -1018.45, 29.48), 1.0, 3.25, {
		name = "LimeysCustomerMenu",
		heading = 70.0,
		debugPoly = Config.PolyZoneTest,
		minZ=31.0,
		maxZ=32.5,
	}, {
		options = {
            {
            event = "qb-menu:ViewLimeysMenu",
            icon = "fas	fa-cocktail",
            label = "View Menu",
            },
		},
		distance = 20.0
	})

        



	exports['qb-target']:AddBoxZone("limeysdrinkmenu", vector3(251.7, -1023.13, 29.98), 0.6, 1.6, {
		name="limeysdrinkmenu",
		heading=160,
		debugPoly=Config.PolyZoneTest,
		minZ=29.5,
		maxZ=30.3,
	}, {
		options = {
			{
				event = "qb-menu:LimeysDrinkMenu",
				icon = "fas	fa-cocktail",
				label = "Drink Menu",
				job = Config.JobName,
			},
		},
		distance = 1.5
	})



        exports['qb-target']:AddBoxZone("limeysstoragecabinet", vector3(253.69, -1020.99, 29.5), 4.6, 0.3, {
            name="limeysstoragecabinet",
            heading=160,
            debugPoly=Config.PolyZoneTest,
            minZ=28.54,
            maxZ=29.45,
        }, {
                options = {
                    {
                        event = "qb-menu:LimeysStorage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = Config.JobName,
                    },
                },
                distance = 1.5
            })

            exports['qb-target']:AddBoxZone("limeysfridge", vector3(252.53, -1019.25, 29.46), 0.55, 2.0, {
                name="limeysfridge",
                heading=70,
                debugPoly=Config.PolyZoneTest,
                minZ=28.54,
                maxZ=29.465,
            }, {
                    options = {
                        {
                            event = "qb-limeysjob:Fridge",
                            icon = "fas	fa-cocktail",
                            label = "Drinks Fridge",
                            job = Config.JobName,
                        },
                    },
                    distance = 1.5
                })


            
                exports['qb-target']:AddBoxZone("limeysmanagerpc", vector3(253.2, -1022.87, 29.51), 0.4, 0.45, {
                    name="limeysmanagerpc",
                    heading=50,
                    debugPoly=Config.PolyZoneTest,
                    minZ=29.5,
                    maxZ=29.75,
                }, {
                        options = {
                            {
                                event = "qb-menu:LimeysManagerPC",
                                icon = "fas fa-laptop",
                                label = "Managers Laptop",
                                job = Config.JobName,
                            },
                        },
                        distance = 1.5
                    })

                    exports['qb-target']:AddBoxZone("limeyscandyshop", vector3(254.87, -1018.85, 29.61), 0.75, 0.4, {
                        name="limeyscandyshop",
                        heading=160,
                        debugPoly=Config.PolyZoneTest,
                        minZ=29.5,
                        maxZ=29.7,
                    }, {
                            options = {
                                {
                                    event = "qb-menu:CandyShop",
                                    icon = "fas	fa-bolt",
                                    label = "Candy Shop",
                                    job = Config.JobName,
                                },
                            },
                            distance = 1.5
                        })

                        exports['qb-target']:AddBoxZone("limeysdonutshop", vector3(254.2, -1016.75, 29.61), 0.6, 0.9, {
                            name="limeysdonutshop",
                            heading=160,
                            debugPoly=Config.PolyZoneTest,
                            minZ=28.55,
                            maxZ=30.3,
                        }, {
                                options = {
                                    {
                                        event = "qb-menu:DonutShop",
                                        icon = "fas	fa-cookie",
                                        label = "Donut Shop",
                                        job = Config.JobName,
                                    },
                                },
                                distance = 1.5
                            })

                        exports['qb-target']:AddBoxZone("LimeysAlarm", vector3(252.71, -1023.00, 28.54), 0.2, 0.2, {
			                name = "LimeysAlarm",
			                heading = 70.0,
			                debugPoly = Config.PolyZoneTest,
			                minZ=29.0,
			                maxZ=29.4,
		                }, {
			                options = {
			                    {
				                event = "qb-limeysjob:LimeysAlarm",
				                icon = "fas	fa-mask",
				                label = "Hit Emergency Panic Alarm",
                                job = Config.JobName,
			                    },
			                },
			                distance = 2.5
		                })


        exports['qb-target']:AddBoxZone("LimeysRegister", vector3(253.39, -1022.33, 29.8), 0.375, 0.475, {
            name="LimeysRegister",
            debugPoly=Config.PolyZoneTest,
            heading=70,
            minZ=29.5,
            maxZ=29.82,
        }, {
                options = {
                    {
                        event = "qb-limeysjob:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Send an Invoice",
                        job = Config.JobName,
                    },
                },
                distance = 1.5
            })
end)


-- QB-MENU --

RegisterNetEvent('qb-menu:ViewLimeysMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Limeys Menu |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Drinks",
            txt = "A lovely cocktail awaits",
            params = {
                event = "qb-menu:ViewLimeysDrinks"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true,
        },
    })
end)

RegisterNetEvent('qb-menu:ViewLimeysDrinks', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Drinks Menu |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Cherry Cocktail",
            txt = "a lovely cocktail.",
            isMenuHeader = true,
        },
        {
            
            header = "• Apple Cocktail",
            txt = "Rumor has it that Issac Newton\'s apple made this.",
            isMenuHeader = true,
        },  
        {
            
            header = "• Banana Cocktail",
            txt = "Brought by the minions",
            isMenuHeader = true,
        },
        {
            
            header = "• Cherry Drink",
            txt = "Cherries!",
            isMenuHeader = true,
        },
        {
            
            header = "• Kiwi Cocktail",
            txt = "Enjoyed by most!",
           isMenuHeader = true,
        },
        {
            
            header = "• Lemon Drink",
            txt = "We all know it\'s lemonade",
            isMenuHeader = true,
        },
        {
            
            header = "• Lime Drink",
            txt = "limes.",
            isMenuHeader = true,
        },
        {
            
            header = "• Orange Drink",
            txt = "Fancy orange juice indubitably.",
            isMenuHeader = true,
        },
        {
            
            header = "• Paradise Cocktail",
            txt = "Livin\' a Paradise",
            isMenuHeader = true,
        },
        {
            
            header = "• Watermelon Drink",
            txt = "Facy Treat!",
            isMenuHeader = true,
        },

        {
            id = 7,
            header = "Back",
            params = {
                event = "qb-menu:ViewLimeysMenu"
            }
        },
    })
end)


RegisterNetEvent('qb-menu:LimeysDrinkMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Drinks Menu |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Cherry Cocktail",
            txt = "a lovely cocktail.",
            params = {
                event = "qb-limeysjob:CherryCocktail"
            }
        },
        {
            
            header = "• Apple Cocktail",
            txt = "Rumor has it that Issac Newton\'s apple made this.",
            params = {
                event = "qb-limeysjob:AppleCocktail"
            }
        },  
        {
            
            header = "• Banana Cocktail",
            txt = "Brought by the minions.",
            params = {
                event = "qb-limeysjob:BananaCocktail"
            }
        },
        {
            
            header = "• Cherry Drink",
            txt = "Cherries!",
            params = {
                event = "qb-limeysjob:CherryDrink"
            }
        },
        {
            
            header = "• Kiwi Cocktail",
            txt = "Enjoyed by most!",
            params = {
                event = "qb-limeysjob:KiwiCocktail"
            }
        },
        {
            
            header = "• Lemon Drink",
            txt = "We all know it\'s lemonade",
            params = {
                event = "qb-limeysjob:LemonDrink"
            }
        },
        {
            
            header = "• Lime Drink",
            txt = "limes.",
            params = {
                event = "qb-limeysjob:LimeDrink"
            }
        },
        {
            
            header = "• Orange Drink",
            txt = "Fancy orange juice indubitably.",
            params = {
                event = "qb-limeysjob:OrangeDrink"
            }
        },
        {
            
            header = "• Paradise Cocktail",
            txt = "Livin\' a Paradise!",
            params = {
                event = "qb-limeysjob:ParadiseCocktail"
            }
        },
        {
            
            header = "• Watermelon Drink",
            txt = "Fancy Treat!",
            params = {
                event = "qb-limeysjob:WatermelonDrink"
            }
        },

        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true,
        },
    })
end)


RegisterNetEvent('qb-menu:LimeysStorage', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Limeys Storage |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Cabinet 1",
            txt = "Access First Cabinet",
            params = {
                event = "qb-limeysjob:Cabinet1"
            }
        },
        {
            
            header = "• Cabinet 2",
            txt = "Access Middle Cabinet",
            params = {
                event = "qb-limeysjob:Cabinet2"
            }
        },
        {
            
            header = "• Cabinet 3",
            txt = "Access Last Cabinet",
            params = {
                event = "qb-limeysjob:Cabinet3"
            }
        },  
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, 
        },
    })
end)

RegisterNetEvent('qb-menu:DonutShop', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Donut Stock |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Get Donuts",
            txt = "Get some yummy donuts to sell!",
            params = {
                event = "qb-limeysjob:donutshop"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, 
        },
    })
end)

RegisterNetEvent('qb-menu:CandyShop', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Candy Stock |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Get Candy",
            txt = "Get some candy to sell!",
            params = {
                event = "qb-limeysjob:candyshop"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, 
        },
    })
end)

RegisterNetEvent('qb-menu:LimeysManagerPC', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| The Manager\'s Laptop |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Order Ingredients",
            txt = "Place an Order for Ingredients",
            params = {
                event = "qb-limeysjob:shop"
            }
        },
        {
           
            header = "• Manage Business",
            txt = "Manage Limey\'s",
            params = {
                event = "qb-bossmenu:client:OpenMenu"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, 
        },
    })
end)

RegisterNetEvent("qb-limeysjob:LimeysAlarm", function()
        TriggerServerEvent('police:server:policeAlert', 'Emergency Button went off at Limeys!')
        QBCore.Functions.Notify("Police will be there soon!", "success")
        print "police alert successful"
end)
-- Till Stuff --
RegisterNetEvent("qb-limeysjob:bill")
AddEventHandler("qb-limeysjob:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-limeysjob:bill:player", bill.citizenid, bill.billprice)
    end
end)

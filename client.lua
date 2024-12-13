ESX = exports["es_extended"]:getSharedObject()

local hunger = 0
local thirst = 0

Citizen.CreateThread(function ()
    while true do
        TriggerEvent('esx_status:getStatus', 'hunger', function(hungerstatus)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirststatus)
                hunger = hungerstatus.getPercent()
                thirst = thirststatus.getPercent()
            end)
        end)

        SendNUIMessage({
            action = 'updateHud',
            health = GetEntityHealth(PlayerPedId()) - 100,
            hunger = hunger,
            thirst = thirst,
            voice = LocalPlayer.state['proximity'].distance,
            talking = NetworkIsPlayerTalking(PlayerPedId()),
        })
        Wait(2500)
    end
end)

local toggle = true

RegisterCommand('hud', function()
    if toggle == true then
        toggle = false
        SendNUIMessage({
            action = 'toggleHud',
            toggle = false
        })
    else
        toggle = true
        SendNUIMessage({
            action = 'toggleHud',
            toggle = true
        })
    end
end)

function toggleProgbar(title, duration)
    SendNUIMessage({
        action = 'toggleProgbar',
        title = title,
        duration = duration
    })
end

exports("toggleProgbar", function(title, duration)
    toggleProgbar(title, duration)
end)

-- exports:toggleProgbar('Przeszukujesz...', 5000)

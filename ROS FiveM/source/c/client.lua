--- ESX START ---
Citizen.CreateThread(function()
    if Config.OldESX then
        while ESX == nil do
            -- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        PlayerData = ESX.GetPlayerData()
    else
        ESX = exports["es_extended"]:getSharedObject()
    end
end)
--- ESX END ---

--- SCRIPT START ---
local isVehicleUpsideDown = false
local disableEngineTime = 0
local disableExitTime = 13 -- Aussteigen blockieren

-- Engine Timer
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        if disableEngineTime > 0 then
            disableEngineTime = disableEngineTime - 1
        end

        if disableExitTime > 0 then
            disableExitTime = disableExitTime - 1
        end
    end
end)

-- Upside Down Check
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            local roll = GetEntityRoll(vehicle)

            if (roll > 175.0 or roll < -175.0) then
                if not isVehicleUpsideDown then
                    ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", 0.3)
                    SetVehicleEngineOn(vehicle, false, true, true)

                    ESX.ShowAdvancedNotification(
                        Config.title,
                        Config.subject,
                        Config.msg,
                        Config.icon,
                        0
                    )

                    disableEngineTime = Config.maxDisableTime
                    disableExitTime = 12 -- 12 SEKUNDEN AUSSTEIGEN BLOCKEN
                end

                isVehicleUpsideDown = true
            else
                isVehicleUpsideDown = false
            end
        else
            isVehicleUpsideDown = false
            disableEngineTime = 0
            disableExitTime = 0
        end
    end
end)

-- Vehicle State (Engine + Driveable)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            local vehicle = GetVehiclePedIsIn(ped, false)

            if disableEngineTime > 0 then
                SetVehicleEngineHealth(vehicle, 0.0)
                SetVehicleUndriveable(vehicle, true)
            else
                SetVehicleUndriveable(vehicle, false)
            end
        end
    end
end)

-- Aussteigen blockieren
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if disableExitTime > 0 then
            DisableControlAction(0, 75, true) -- EXIT VEHICLE (F / ENTER)
        end
    end
end)

--- SCRIPT END ---
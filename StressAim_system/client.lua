local shootActive = false
local aimActive = false

CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()
        if not DoesEntityExist(ped) then 
            if Config.Debug then print("^1[DEBUG] ^7Ped does not exist!") end
            goto continue
        end

        local isAiming = IsPlayerFreeAiming(PlayerId())
        local isShooting = IsPedShooting(ped)

        -- =========================
        -- Shooting: pure shake
        -- =========================
        if Config.TriggerOnShooting then
            if isShooting then
                ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", Config.ShootEffect.intensity)
                if Config.Debug and not shootActive then
                    shootActive = true
                    print("^2[DEBUG] ^7Shooting detected. Applying camera shake (Intensity: "..(Config.ShootEffect.intensity or 0)..")")
                end
            elseif shootActive then
                shootActive = false
                if Config.Debug then
                    print("^3[DEBUG] ^7Stopped shooting. Removing camera shake.")
                end
                StopGameplayCamShaking(true)
            end
        end

        -- =========================
        -- Aiming: subtle moving-around effect
        -- =========================
        if Config.TriggerOnAiming then
            if isAiming and not aimActive then
                aimActive = true
                SetTimecycleModifier(Config.AimEffect.timecycle)
                SetTimecycleModifierStrength(Config.AimEffect.strength)
                ShakeGameplayCam("DRUNK_SHAKE", Config.AimEffect.intensity)
                if Config.Debug then
                    print("^2[DEBUG] ^7Aiming detected. Applying aim effect (Intensity: "..(Config.AimEffect.intensity or 0)..")")
                end
            elseif not isAiming and aimActive then
                aimActive = false
                ClearTimecycleModifier()
                StopGameplayCamShaking(true)
                if Config.Debug then
                    print("^3[DEBUG] ^7Stopped aiming. Removing aim effect.")
                    print("^5[DEBUG] ^9made by yxlvert")
                end
            end
        end

        ::continue::
    end
end)

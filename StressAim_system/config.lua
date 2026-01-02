Config = {

    -- Debug mode
    Debug = false, -- (prints triggers and errors to console)

    -- Camera shake when shooting
    ShootEffect = {
        intensity = 0.0 -- 0.1 > 1.0, higher = stronger shake
    },

    -- Movement effect when aiming
    AimEffect = {
        intensity   = 0.99,          -- camera shake while aiming
        timecycle   = "spectator5",  -- subtle screen shift effect
        strength    = 0.0            -- timecycle strength (0 = no visual filter)
    },

    -- Toggles
    TriggerOnAiming   = true,
    TriggerOnShooting = true
}

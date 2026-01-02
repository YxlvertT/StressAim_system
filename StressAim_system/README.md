# 🎯 StressAim_system

StressAim_system is a lightweight **client-side FiveM script** that adds realistic
**camera movement while aiming** and **camera shake while shooting** to simulate
stress, adrenaline, or combat pressure.

No frameworks required. Plug & play.

---

## ✨ Features

- 🔫 **Shooting Effect**
  - Clean camera shake only (no blur, no filters)
  - Adjustable intensity
  - Continuous while firing

- 🎯 **Aiming Effect**
  - “Moving-around” / unstable camera feeling
  - Optional timecycle effect
  - Adjustable strength

- 🛠️ **Debug Mode**
  - Prints triggers to console
  - Shows when aiming/shooting starts & stops
  - Helps diagnose errors

- ⚡ **Lightweight**
  - Client-side only
  - No ESX / QBCore / QBX needed

---

## 📁 Resource Structure

SC_StressAim/
│── fxmanifest.lua
│── config.lua
│── client.lua
│── README.md


---

## ⚙️ Installation

1. Place `StressAim_system` into your `resources` folder
2. Add to `server.cfg`:


ensure SC_StressAim

3. Configure `config.lua`
4. Restart the server or resource

---

## 🧩 Configuration

### `config.lua`
```lua
Config = {

 -- Debug mode
 Debug = false, -- prints triggers and errors to console

 -- Camera shake when shooting
 ShootEffect = {
     intensity = 0.1 -- 0.1 → 1.0 (higher = stronger shake)
 },

 -- Movement effect when aiming
 AimEffect = {
     intensity   = 0.99,          -- camera movement strength
     timecycle   = "spectator5",  -- screen effect (optional)
     strength    = 0.0            -- set 0.0 to disable visual filter
 },

 -- Toggles
 TriggerOnAiming   = true,
 TriggerOnShooting = true
}

🧠 How It Works

Aiming

Adds camera instability to simulate stress

No forced blur or distortion unless enabled

Shooting

Applies recoil-style camera shake

Stops instantly when shooting stops

Fully visual only — no gameplay changes

🧪 Debug Output Examples
[DEBUG] Aiming detected. Applying aim effect.
[DEBUG] Stopped aiming. Removing aim effect.
[DEBUG] Shooting detected. Applying camera shake.
[DEBUG] Stopped shooting. Removing camera shake.


Enable or disable debug logs using:

Debug = true

❗ Notes

Lower intensity if the effect feels too strong

To disable visual effects completely:

strength = 0.0


Works with all weapons

Optimized for performance

📜 License

Free to use.
Free to edit.
Free to redistribute.

Credit is appreciated but not required.

💬 Support

If something isn’t working:

Enable Debug = true

Check your F8 console

Make sure config.lua loads before client.lua
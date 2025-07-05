
<p align="center">
  <img src="https://upload.fixitfy.com.tr/images/FIXITFY-YdjrzeXFcV.png" width="700"/>
  <img src="https://upload.fixitfy.com.tr/images/FIXITFY-YdjrzeXFcV.png" width="700"/>
</p>

# FX-ChannelSystem

> **RedM PolyZone Routing Bucket Controller**  
> Optimize player & entity separation to minimize OneSync conflicts.

---

## 📌 Overview

The `FX-ChannelSystem` is a **dynamic routing bucket manager** for RedM that uses **PolyZone-defined zones** to assign players and all their related entities (mounts, vehicles, animals, NPCs, etc.) into separate network buckets. This helps isolate local interactions and **reduces OneSync entity visibility and collision bugs** in dense or interactive areas.

---

## 🎯 Purpose

In OneSync environments on RedM, multiple players interacting with shared entities (mounts, NPCs, wagons, AI companions, etc.) can cause:
- **Mount/vehicle desync**
- **Invisible or bugged NPCs**
- **Cross-player AI interference**
- **Excessive server bandwidth usage due to global replication**

This script resolves that by dynamically splitting players into **routing buckets**, ensuring isolated environments where needed — particularly useful in:
- Cinematic scenes
- Stables
- Job zones (e.g., bounty, delivery, crafting)
- Instanced interiors
- Roleplay scenarios with AI followers

---

## 🧠 Features

✅ Player enters zone → automatically moved to a dedicated bucket  
✅ Also routes all related entities:
- 👤 Player ped
- 🐎 Mounted horse
- 🐴 Lead horse
- 🚙 Vehicle / Wagon
- 🐾 Ped group followers (AI animals)
- 🤖 Nearby networked NPCs

✅ Player leaves zone → returns to original default bucket  
✅ Highly optimized to avoid:
- RedM `[entity] no net object` warnings  
- Excessive entity lookups  
- Non-networked or ambient peds being mistakenly moved

---

## 🛠️ How It Works

1. Zones are defined in `Config.ChannelZones`.
2. When a player enters a zone:
   - The script gathers **all related and nearby networked entities**.
   - Calls `SetPlayerRoutingBucket()` and `SetEntityRoutingBucket()` for each one.
3. When leaving:
   - All affected entities are reset to their original bucket.

---

## ⚙️ Configuration Notes

- Each `zone` entry in `Config.ChannelZones` must have a **unique `channelId`**.
- All `zoneId` indices (table keys) must also be unique.
- If two zones share the same `channelId`, players and entities may unintentionally share environments.
- Make sure to avoid `channelId = 0` as it is considered the default/global bucket.

Example:
```lua
Config.ChannelZones = {
    [1] = {
        channelId = 1,
        name = "Blackwater Photographer",
        ...
    },
    [2] = {
        channelId = 2,
        name = "Blackwater Justice",
        ...
    }
}
```

---

## 🔒 OneSync Safety

This script prevents the most common OneSync routing issues by:
- Avoiding use of non-networked entities in `SetEntityRoutingBucket`
- Skipping ambient world peds (wildlife, civilian AI)
- Including `NetworkHasControlOfEntity` logic where necessary
- Using `NetworkGetNetworkIdFromEntity()` **only after verifying entity is networked**

---

## 📦 Installation

1. Place the script folder in your RedM resource directory.
2. Add to your `server.cfg`:

```
ensure fx-channelsystem
```

3. Configure zones inside `config.lua` as described above.

---

## 🧪 Requirements

- RedM Server with OneSync enabled  
- [PolyZone](https://github.com/mkafrin/PolyZone) (required dependency)

---

## 📣 Credits

Developed by **Fixitfy Development**  
Optimized for heavy-roleplay and AI-dense RedM servers.

---

## 💬 Feedback

Found a bug or need a new feature?  
Open an issue or contact us via [Discord](https://discord.gg/your-link).

---

## 🧰 License

MIT License — Free to use, modify, and distribute.  
Attribution appreciated but not required.

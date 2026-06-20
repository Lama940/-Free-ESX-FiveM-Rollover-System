# -Free-FiveM-Rollover-System
Advanced FiveM rollover detection system with vehicle lock, notifications and temporary exit restriction after a vehicle flips.

# FiveM Rollover System

An advanced FiveM rollover detection system that improves realism after a vehicle overturns.

## Features

- Detects when a vehicle rolls over
- Sends a notification to the driver
- Prevents the vehicle from moving after the rollover
- Blocks exiting the vehicle for the first 15 seconds
- Lightweight and optimized
- Easy configuration
- Client-side protection

## Installation

1. Download or clone this repository.
2. Place it into your `resources` folder.
3. Add the resource to your `server.cfg`.

```cfg
ensure fivem-rollover-system
```

## Configuration

You can easily configure:

- Exit lock duration
- Notifications
- Detection sensitivity
- Debug mode

## How it works

1. The script continuously monitors the vehicle's orientation.
2. If the vehicle overturns, the system detects the rollover.
3. The driver receives a notification.
4. The vehicle becomes immobilized.
5. The player cannot exit the vehicle for the first **15 seconds**.
6. After the timer expires, exiting the vehicle is allowed again.

## Requirements

- FiveM
- OneSync (recommended)

## 📄 License

MIT License

---

Made with ❤️ for the FiveM community.

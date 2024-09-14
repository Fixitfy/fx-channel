# Fixitfy Channel System

The Fixitfy Channel System is a script designed for RedM to optimize player experience in crowded areas by automatically managing player channels. When the player count exceeds a certain threshold within a specified area, the script seamlessly transfers players to different channels, helping to minimize server lag and performance issues.

## Features

- **Automatic Channel Switching**: Players are automatically moved to different channels when they enter areas with high player density, ensuring smoother gameplay and reduced lag.
- **Configurable Areas**: Define specific areas in the `config.lua` file where channel switching should occur. You can set different thresholds and channels for each area.
- **Optimized Performance**: By distributing players across multiple channels, this system reduces the strain on any single channel, allowing for higher player counts with minimal issues.
- **Seamless Integration**: The script operates in the background without interrupting gameplay, providing a smooth transition between channels.
- **Customizable**: Easily configure areas, thresholds, and other parameters through the `config.lua` file to fit your server's needs.

## Installation

1. **Download and Extract**: Download the script files and extract them into your `resources` folder.
2. **Configure**: Open the `config.lua` file and set up the areas, channels, and thresholds according to your server's needs.
3. **Start the Resource**: Add `ensure fx-channel` to your `server.cfg` file to ensure the resource starts with your server.
4. **Enjoy**: The system will automatically manage player channels, optimizing performance in crowded areas.

## Configuration

All settings are configured in the `config.lua` file. You can specify the different areas on the map where channel switching should take place and which channels the players allowed in each area should be moved to before switching.

## Dependency

- [PolyZone](https://github.com/kurdt94/PolyZone)

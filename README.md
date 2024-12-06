# Retro Snake Game 🐍
A classic Snake game with a retro twist, built using `Love2D`

## Installation and Setup Instructions

### Step 1: Prerequisites
This project is developed for **Love2D 11.5**. Make sure you have it installed.  
Download *Love2D* from the official website: [`love2d.org`](https://love2d.org/)

---

### Step 2: Run the Project
1. **Download or Clone the Project:**
   ```bash
   git clone https://github.com/mersaadh/LOVE2d-Retro-Snake-Game.git
   cd LOVE2d-Retro-Snake-Game
   ```


2. **Run with Love2D:**
    Open the **Love2D application** and drag and drop the project folder onto it.

3. **(Optional) Using VS Code:**

    Install the **Love2D extension**.
    Open the project in VS Code.
    Press `Alt + L` to launch the game directly from the editor.

### Step 3: Build an Executable
1.  To create an `.exe` for the game:

    Refer to the **[Love2D Build Documentation](https://love2d.org/wiki/Game_Distribution)** for detailed instructions.

# Map Creation Guide 🗺️

## Prerequisites
- Download and install **`Tiled Map Editor`** from [**mapeditor.org**](https://www.mapeditor.org/)

---

## Steps to Create a Map

### Step 1: Create a New Map
1. Open Tiled and create a new map with your desired dimensions.
2. Use **Tile Layers** to design the visual aspects of your map.

---

### Step 2: Add Collisions
1. Create a new **`Object Layer`** for collisions.
2. Enable **Snap to Grid** from the menu:
   - Go to **View > Snapping > Snap to Grid**.
3. Use the grid to add collision boxes to each cell of the map that should act as a wall.

## Loading Your Map
After completing your map, you can start the game with your custom map by using its unique ID.

*Happy map-making! :)*

## License
All source code hosted on this repository is licensed under the MIT license. See the [LICENSE](./LICENSE) file for more details.
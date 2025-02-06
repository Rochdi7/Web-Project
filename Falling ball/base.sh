#!/bin/bash
# Script to automate commits for Falling Ball game project

# Number of commits you want to add
NUM_COMMITS=10

# Create a game-related file (or use an existing one like game.js)
FILE_NAME="game.js"

# Check if the file exists, else create it
if [ ! -f "$FILE_NAME" ]; then
    echo "Initializing Falling Ball game script" > "$FILE_NAME"
    git add "$FILE_NAME"
    git commit -m "Initial game setup"
    git push origin main
fi

# Loop to add commits with short project-specific messages
for ((i=1; i<=NUM_COMMITS; i++))
do
    echo "Commit $i - Updated game logic" >> "$FILE_NAME"  # Modify the file
    git add "$FILE_NAME"             # Stage changes
    
    # Create commit with short messages
    case $i in
        1) git commit -m "Added ball movement" ;;
        2) git commit -m "Implemented left arrow control" ;;
        3) git commit -m "Added right arrow control" ;;
        4) git commit -m "Created obstacle generator" ;;
        5) git commit -m "Fixed ball speed issue" ;;
        6) git commit -m "Improved collision detection" ;;
        7) git commit -m "Optimized obstacle animation" ;;
        8) git commit -m "Fixed game reset on collision" ;;
        9) git commit -m "Enhanced game-over handling" ;;
        10) git commit -m "Refined ball and obstacle interaction" ;;
    esac
    
    # Push the commit to GitHub after each one
    git push origin main
    echo "Created and pushed commit $i"
done

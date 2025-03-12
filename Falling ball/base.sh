#!/bin/bash
# Script to automate commits with 10 unique messages tailored for Falling Ball Game project

# Number of iterations
ITERATIONS=10

# Create a dummy file to modify
FILE_NAME="dummy.txt"

# Array of 10 unique commit messages for the Falling Ball game project
COMMIT_MESSAGES=(
    "Initial setup for Falling Ball game"
    "Added ball movement functionality"
    "Implemented left arrow control"
    "Implemented right arrow control"
    "Created obstacle generator"
    "Fixed ball speed issue"
    "Improved collision detection"
    "Optimized obstacle animation"
    "Added game-over functionality"
    "Refined ball and obstacle interaction"
)

# Check if the file exists, else create it
if [ ! -f "$FILE_NAME" ]; then
    echo "Initializing Falling Ball game script" > "$FILE_NAME"
    git add "$FILE_NAME"
    git commit -m "Initial game setup"
    echo "Initialized $FILE_NAME and made the first commit."
fi

# Loop to add 10 iterations of commits with random messages
for ((i=1; i<=ITERATIONS; i++))
do
    # Pick a random commit message from the array
    RANDOM_INDEX=$((RANDOM % ${#COMMIT_MESSAGES[@]}))
    COMMIT_MESSAGE="${COMMIT_MESSAGES[$RANDOM_INDEX]}"

    # Modify the dummy file with the commit message (or any changes related to the game)
    echo "$COMMIT_MESSAGE - Iteration $i" >> "$FILE_NAME"

    # Stage and commit the changes
    git add "$FILE_NAME"
    git commit -m "$COMMIT_MESSAGE"

    # Output a message for each commit
    echo "Created commit: $COMMIT_MESSAGE"
done

# Push changes to GitHub
git push origin main --force

echo "All $ITERATIONS commits have been pushed to GitHub."

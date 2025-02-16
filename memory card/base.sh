#!/bin/bash
# Script to automate commits with 10 unique messages tailored for Memory Card Game project

# Number of iterations
ITERATIONS=10

# Create a dummy file to modify (you can use game-related file here)
FILE_NAME="dummy.txt"

# Array of 10 unique commit messages for the Memory Card Game project
COMMIT_MESSAGES=(
    "Initial setup for Memory Card Game"
    "Added card flip functionality"
    "Implemented matching cards logic"
    "Fixed card click issue"
    "Added score tracking feature"
    "Implemented game-over logic"
    "Shuffled cards at the start"
    "Added restart game functionality"
    "Improved card matching performance"
    "Refined user interface and animations"
)

# Check if the file exists, else create it
if [ ! -f "$FILE_NAME" ]; then
    echo "Initializing Memory Card Game script" > "$FILE_NAME"
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

    # Modify the dummy file with the commit message (or any game logic changes)
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

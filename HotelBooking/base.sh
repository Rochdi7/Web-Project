#!/bin/bash
# Script to automate commits for the Hotel Booking Landing Page project

# Number of commits you want to add
NUM_COMMITS=10

# Create a dummy file to modify
FILE_NAME="dummy.txt"

# Check if file exists, else create it
if [ ! -f "$FILE_NAME" ]; then
    echo "Initializing dummy file for Hotel Booking project" > "$FILE_NAME"
    git add "$FILE_NAME"
    git commit -m "Initial commit: Setup Hotel Booking project"
fi

# Commit messages related to the project
commit_messages=(
    "Added navigation bar with responsive menu"
    "Designed header section with booking form"
    "Implemented popular hotels section with cards"
    "Styled the special offers section"
    "Enhanced travel blog section with images and content"
    "Integrated client testimonials carousel"
    "Optimized footer with legal and resource links"
    "Added reward section for discounts"
    "Improved accessibility and semantic HTML"
    "Finalized layout and minor style fixes"
)

# Loop to add commits
for ((i=1; i<=NUM_COMMITS; i++))
do
    echo "Change $i: ${commit_messages[i-1]}" >> "$FILE_NAME"  # Modify the file
    git add "$FILE_NAME"                                      # Stage changes
    git commit -m "${commit_messages[i-1]}"                  # Create commit
    echo "Created commit $i: ${commit_messages[i-1]}"
done

# Push changes to GitHub
git push origin main

#!/bin/bash
# Script to automate 10 unique commits for Digital Agency Landing Page

ITERATIONS=10
FILE_NAME="dummy.txt"
COMMIT_MESSAGES=(
    "Initial commit - Project setup"
    "Added responsive navbar"
    "Updated hero section CTA"
    "Improved client testimonials"
    "Refactored services layout"
    "Enhanced SEO optimization"
    "Fixed mobile responsiveness"
    "Updated contact form validation"
    "Refined footer and social links"
    "Final optimizations & bug fixes"
)

[ ! -f "$FILE_NAME" ] && echo "Init file" > "$FILE_NAME" && git add "$FILE_NAME" && git commit -m "Initial commit"

for ((i=0; i<ITERATIONS; i++)); do
    echo "${COMMIT_MESSAGES[$i]} - Iteration $((i+1))" >> "$FILE_NAME"
    git add "$FILE_NAME"
    git commit -m "${COMMIT_MESSAGES[$i]}"
    echo "Committed: ${COMMIT_MESSAGES[$i]}"
done

git push origin main
echo "All commits pushed to GitHub."

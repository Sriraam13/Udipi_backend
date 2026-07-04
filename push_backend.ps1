$ErrorActionPreference = "Stop"

Write-Host "Fetching from Food_Ordering_App_Backend..."
git fetch food_ordering_backend

Write-Host "Merging remote development branch to not overwrite existing files..."
# This will pull remote changes and merge them.
git merge food_ordering_backend/development --allow-unrelated-histories -m "Merge remote development branch to prevent overwriting existing repo files"

Write-Host "Adding files..."
git add .

Write-Host "Committing local changes..."
# We use || true logic in PS:
if (git status --porcelain) {
    git commit -m "chore: push backend code with updated .gitignore"
} else {
    Write-Host "No new changes to commit."
}

Write-Host "Pushing to remote development branch..."
git push food_ordering_backend HEAD:development

Write-Host "Done!"

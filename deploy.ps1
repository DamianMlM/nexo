
# Initialize Git
git init
git add .
git commit -m "Initial commit - DALE Landing Page"
git branch -M main

# Configure Remote
if ((git remote | Select-String "origin") -eq $null) {
    git remote add origin https://github.com/DamianMlM/nexo.git
} else {
    git remote set-url origin https://github.com/DamianMlM/nexo.git
}

# Push to GitHub
git push -u origin main

# Build and Deploy to Firebase
npm run build
# Try local firebase first, then npx
if (Get-Command firebase -ErrorAction SilentlyContinue) {
    firebase deploy --only hosting
} else {
    npx firebase-tools deploy --only hosting
}

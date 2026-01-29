#!/bin/bash
# Script to do basic tasks and push to GitHub with git.
rm -rf fol_1
rm -rf fol_2
mkdir -p fol_1
mkdir -p fol_2
cd fol_1
touch 1_1.txt
touch 1_2.txt
touch 1_3.txt
cd ../fol_2
touch 2_1.txt
touch 2_2.txt
touch 2_3.txt
cd ..
touch .gitignore
echo fol_1 >> .gitignore
echo fol_2 >> .gitignore
chmod 600 fol_1/1_1.txt
chmod 600 fol_1/1_3.txt
chmod 600 fol_2/2_1.txt
chmod 600 fol_2/2_3.txt
chmod 777 fol_1/1_2.txt
chmod 777 fol_2/2_2.txt
touch README.md
echo "# Week 2 Lab – Bash & Git" > README.md
echo Eoin Fitzsimons X23151374 >> README.md
echo "[Eoin's GitHub](https://github.com/EoinFitzsimons)" >> README.md
echo --- >> README.md
echo "To run the script.sh run: \`bash script.sh\`" >> README.md

echo "Job completed"

# --- Git steps (idempotent) ---
# Initialise repo if not present
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init
fi

# Only included to ensure commits succeed in fresh environments where no global
# user identity is set. This is a fallback so the script will not fail; it is
# not intended as a replacement for configuring your real user details.
if [ -z "$(git config user.email)" ]; then
  git config user.email "you@example.com"
fi
if [ -z "$(git config user.name)" ]; then
  git config user.name "Your Name"
fi

git add .
git commit -m "Final commit" || echo "Nothing to commit"

# If a remote URL is supplied as the first argument, add or update `origin`
if [ -n "$1" ]; then
  if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$1"
  else
    git remote add origin "$1"
  fi
fi

# Ensure branch name is `main` locally; do not push automatically (requires auth)
git branch -M main
echo "Setup complete. To push: git push -u origin main"
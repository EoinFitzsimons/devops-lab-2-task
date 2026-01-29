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

# Initialize git repo (if needed) and make an initial commit
if [ ! -d .git ]; then
	git init
fi

# Ensure a local user.name/user.email so commit succeeds in fresh environments
if [ -z "$(git config user.email)" ]; then
	git config user.email "you@example.com"
fi
if [ -z "$(git config user.name)" ]; then
	git config user.name "Your Name"
fi

git add .
git commit -m "Initial commit - project files" || echo "Nothing to commit or commit failed"
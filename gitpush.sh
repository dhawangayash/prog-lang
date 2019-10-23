find . -type f | grep \~ | xargs -I {} rm {}
git pull origin master
git add .
git commit -m "adding new files"
git push origin master

rm `find . -type f | grep \~`
git pull origin master
git add .
git commit -m "adding new files"
git push origin master

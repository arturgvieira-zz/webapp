Develop
=======
* chmod +x tools/*.sh
* ./tools/init.gradle.sh

Deploy to localhost
===================
* java -jar deploy/runner/webapp-runner*.jar build/libs/*.war

Deploy with Heroku
==================
* git init
* git add .
* git commit -m "Initial commit"
* (if Heroku CLI is not installed then run init.deploy.sh)
* git remote add heroku https://your.repo.git
* git push heroku

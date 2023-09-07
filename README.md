# NewRelic Deployment Marker task

This task is developed for to mark the deployment marker in NewRelic using Azure DevOps as CI/CD Pipelines. 

### Features / Benefits

- Task to define in Build & Release Pipelines to automate the deployment marker
- Task get logged username and pass to NewRelic while deployment marker
- Task has option to define revision value dynamically
- Pass API key from variable as password protected fom

# Make your modifications and build code again
 - Login and create publisher profile on https://aka.ms/vsmarketplace-manage
 - Modify project and run command in project path : npm install -g tfx-cli
 - Create a tfx file to upload marketplace : npx tfx-cli extension create
 - If an error occured because of uuid generate a new uuid5 on internet and change in task.json
 - Upload created extension file to marketplace shared for just your organizarion or public

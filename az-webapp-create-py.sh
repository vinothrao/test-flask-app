#!/bin/bash

rm -f ./deploy.zip
zip -r ./deploy.zip . -x ./.git\* ./.vscode\* ./deploy\*

az webapp config appsettings set -g "jenkins-test" -n "jenkins-py-test" --settings "SCM_DO_BUILD_DURING_DEPLOYMENT=true" "AZTENANTID=e5e52782-1721-47fb-ac56-634bbf7b0493" 
if [ ! -z "$BUILDTAG" ]; then
    az webapp config appsettings set -g "jenkins-test" -n "jenkins-py-test" --settings "BUILDTAG=1"
fi
az webapp deployment source config-zip -g "jenkins-test" -n "jenkins-py-test" --src ./deploy.zip

#!/bin/bash

rm -f ./deploy.zip
zip -r ./deploy.zip . -x ./.git\* ./.vscode\* ./deploy\* Jenkisfile az-webapp-create-py.sh

az webapp config appsettings set --resource-group jenkins-test --name jenkins-py-test --settings SCM_DO_BUILD_DURING_DEPLOYMENT=true 
if [ ! -z "$BUILDTAG" ]; then
    az webapp config appsettings set -g "jenkins-test" -n "jenkins-py-test" --settings "BUILDTAG=1"
fi
az webapp deploy -g "jenkins-test" -n "jenkins-py-test" --src-path deploy.zip --type "zip"

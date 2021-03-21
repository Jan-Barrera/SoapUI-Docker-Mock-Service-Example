#!/usr/bin/env sh

echo "starting mock service"
mockservicerunner.sh -m "Mock-Rest" ~/Mock-Service-soapui-project.xml
echo "mock service started"

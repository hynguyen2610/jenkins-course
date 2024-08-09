#!/bin/bash

# Jenkins credentials
USER="admin"
API_TOKEN="118d34bf7aea2913a4720e14f38b144c5d"
JENKINS_URL="http://jenkins:8080"
JOB_NAME="maven-test-job"
BUILD_TOKEN="TTK"

# Get the crumb
CRUMB_INFO=$(curl -s -u "$USER:$API_TOKEN" "$JENKINS_URL/crumbIssuer/api/json")

# Parse the crumb and crumbRequestField using awk
CRUMB=$(echo "$CRUMB_INFO" | awk -F'"crumb":"' '{print $2}' | awk -F'"' '{print $1}')
CRUMB_FIELD=$(echo "$CRUMB_INFO" | awk -F'"crumbRequestField":"' '{print $2}' | awk -F'"' '{print $1}')

# Check if crumb and crumb field are empty
if [ -z "$CRUMB" ] || [ -z "$CRUMB_FIELD" ]; then
  echo "Error: Could not extract crumb information."
  exit 1
fi

# Trigger the Jenkins job
curl -X POST "$JENKINS_URL/job/$JOB_NAME/build?token=$BUILD_TOKEN" \
     -H "$CRUMB_FIELD:$CRUMB" \
     -u "$USER:$API_TOKEN"

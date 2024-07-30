#!/bin/bash

# Fetch Jenkins crumb and store it in a variable
response=$(curl -i -s -u jenkins:1234 'http://jenkins:8080/crumbIssuer/api/json')

# Extract JSESSIONID cookie from the response headers
cookie=$(echo "$response" | grep -i '^Set-Cookie:' | awk '{print $2}')

# Extract Jenkins crumb from JSON response
crumb=$(echo "$response" | grep -o '"crumb":"[^"]*' | sed 's/"crumb":"//')

# Execute the Jenkins job using the crumb and cookie headers
curl -i -u jenkins:1234 -X POST "http://jenkins:8080/job/hello/buildWithParameters?delay=0sec&NAME=Hehe" \
     -H "Jenkins-Crumb: $crumb" \
     -H "Cookie: $cookie"

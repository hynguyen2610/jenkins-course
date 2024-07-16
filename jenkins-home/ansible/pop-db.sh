#!/bin/bash

# Copy the put.sh into db container /tmp
docker cp put.sh db:/tmp/

# Copy the people.txt to db container /tmp
docker cp people.txt db:/tmp/

# Allow execution of put.sh inside db container
docker exec db chmod +x /tmp/put.sh

# Show the files in db /tmp/
echo "Content of db /tmp :"
docker exec db ls /tmp | awk '{print "  " $0}'

# Execute put.sh
docker exec db /bin/bash -c "cd /tmp && ./put.sh"

echo "The db init has been successfully finished"
echo "Total rows number in register table is: "
docker exec db /bin/bash -c "mysql -u root -p1234 -e 'USE people; SELECT COUNT(*) FROM register;'"


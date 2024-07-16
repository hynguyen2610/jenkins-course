counter=0
length=$(wc -l < people.txt)

mysql -u root -p1234 people -e "DELETE FROM register"

while [ $counter -lt $length ]; do
  counter=$((counter + 1))
  line=$(nl people.txt | grep -w $counter | awk '{print $2}')
  name=$(echo $line | awk -F ',' '{print $1}')
  lastname=$(echo $line | awk -F ',' '{print $2}')
  age=$(shuf -i 20-25 -n 1)
  
  mysql -u root -p1234 people -e "INSERT INTO register VALUES($counter, '$name', '$lastname', $age)"
  echo "$counter, $name $lastname, $age has been successfully imported"
done

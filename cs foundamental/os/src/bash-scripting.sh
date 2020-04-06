#!/bin/bash

# command line arguments
echo "\$0 - current script name: $0"
echo "\$1 - first param: $1"
echo "\$2 - second param: $2"
echo "\$# - number of params: $#"
echo "\$* - param list: $*"
echo "\$$ - process id: $$"
echo "\$? - last return code: $?"

# suppress the new line
echo -n "Enter user name: "
read user_name

if [ -n $user_name ]; then
    echo "Hello, $user_name!"
else
    printf "no name"
fi

# function
function showStatus {
    echo "Status of $1 is OK"
}

showStatus car

# control flow
# -eq: equal
# -ne: not equal
# -lt: less than
# -le: less than or equal to
# -gt: greater than
# -ge: greater than or equal to

if [ 1 -ne 2 ] && [ 2 -ne 3 ]; then
    echo "Not equal"
fi

# -n: not null
# -z: is null

if [ -z $name ] && [ -n $user_name ]; then
    echo "Not null"
fi

# -d: directory exists
# -e: file exists
# -f: file exists and a regular file
# -r: file exists and you have read permission
# -s: file exists and not empty
# -w: file exists and you have write permission
# file -nt file2: file is newer than file2
# file -ot file2: file is older than file2
if [ -e $0 ]; then
    echo "File exists"
fi

# case
case $1 in
    help) echo "Param matched: $1" ;;
    *) echo "Other matched."
esac

# for loop
for script in *.sh; do
    echo $script
done

# while loop
exec 0<$0
counter=1
while read line; do
    echo "$((counter++)): $line"
done
echo "Counts: $counter"

# arithmetic
a=1 b=$((2))
c=$a+$b d=$(($a+$b))
printf "$a + $b = $c \t(plus sign as string literal)\n"
printf "$a + $b = $d \t(plus sign as arithmetic addition)\n"

# array
example=(aa 'bb cc' dd)
example[3]=ee
echo "example[@] = ${example[@]}"
echo "example array contains ${#example[@]} elements"
for elt in "${example[@]}"; do 
    echo " Element = $elt"
done
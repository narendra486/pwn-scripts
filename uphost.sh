cat /path/to/list.txt |  while read output
do
    ping -c 1 "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo "output" >>ping_up.txt 
    else
    echo "output" >>ping_down.txt
    fi
done

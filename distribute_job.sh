# takes in a script with multiple lines and distributes training across nodes
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
fi
END=$(wc -l $1 | awk '{print $1}')
echo "$END lines"

# params
EXECUTION_PATH='proj3_2'
MACHINE_LIST='machine_list2.txt'
OUTPUT_FILE='nohup2.txt'

# don't change this
for i in `seq 1 $END`;
do
	echo "$i sup"
	machine=$(sed "${i}q;d" $MACHINE_LIST)
	line=$(sed "${i}q;d" $1)
	echo "running '$line' on $machine"
	nohup ssh $machine "cd $EXECUTION_PATH; $line" &> $OUTPUT_FILE&
done

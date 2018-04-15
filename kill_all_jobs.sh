# kills all jobs on hive w/ your username
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
fi
MACHINE_LIST=machine_list.txt
USER_ID=cs184-agk
END=$(wc -l $MACHINE_LIST | awk '{print $1}')
for i in `seq 1 $END`;
do
	echo "$i sup"
	machine=$(sed "${i}q;d" machine_list.txt)
	echo "killing all tasks on  $machine"
	line="ps -o pid= -u $USER_ID | xargs kill -9"
	nohup ssh $machine "$line" &> nohup2.txt&
done

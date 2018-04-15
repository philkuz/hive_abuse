# Hive Abuse
I used these scripts to quickly distribute my graphics generation code for 184 on the UC Berkeley hive student cluster. Use at your own risk, I am pretty sure there's some user agreement against using all of the cluster at once.

## Setup
1. Make sure you can [passwordless ssh](https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/) between your host/master machine and the hive cluster. 
    * You should probably make the host/master one of the hive machines.
2. Make sure that the script you want to run is atomic. Ie each line should not be dependent or interact w/ any of the others. 
    * I've included one of the scripts I used `part3.sh`
3. Set the parameters in `distribute_job.sh` and `kill_jobs.sh`. Namely you should set `$EXECUTION_PATH` and `OUTPUT_FILE`. 
    * I have multiple machine lists so that I could make sure I could run other experiments. 
    * You're welcome to make a full list if you'd lke.

## Running
```
bash distribute_job.sh <your-script.sh>
```
### killing your jobs
```
# make sure you set $MACHINE_LIST
bash kill_all_jobs.sh
```



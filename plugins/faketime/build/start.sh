#!/bin/bash

get_child_pids() {
    local parent_pid=$1
    local child_pids_list=$(pgrep -P $parent_pid)

    for child_pid in $child_pids_list; do
        child_pids+=("$child_pid")
        get_child_pids "$child_pid"
    done
}

declare -a child_pids=()
process_array=(`echo $modify_process_name | tr ',' ' '`)

for process_name in ${process_array[@]}
do
  sp_pid=`ps ax|grep $process_name|grep -v grep|grep -v /bin/sh|awk '{print $1}'`
  if [ -n "$sp_pid" ]
  then
    if [ "$Modify_Sub_Process" == "true" ]
    then
      get_child_pids "$sp_pid"
    fi
  fi
done


echo "List of processes that will be modified： ${child_pids[*]}"
for modify_process_pid in ${child_pids[@]}
do
  echo $modify_process_pid >&2
  ./bin/watchmaker -pid $sp_pid -sec_delta $delay_second -nsec_delta 0 -clk_ids "CLOCK_REALTIME,CLOCK_MONOTONIC"
done
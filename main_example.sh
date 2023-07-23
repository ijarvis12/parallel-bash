#!/bin/bash

sync=/dev/shm/syntest-$$ # allocate a shared memory segment name for this process
echo '0\n' > $sync # init the shm


echo '1\n' >> $sync &
echo '1\n' >> $sync &
wait
lines=$(cat $sync)
num=0
for i in $lines; do
  let "num+=${i::-2}"
done
echo $num
rm $sync
exit 0

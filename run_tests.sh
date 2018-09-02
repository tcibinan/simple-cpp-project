#!/usr/bin/env bash

echo 'Tests:'

test_groups=$@

failed=false
for test_group in $test_groups
do
    echo
    echo "> $test_group:"
    ./run_test.sh $test_group
    if [ $? != 0 ]
    then
        failed=true
    fi
done

echo
if [ $failed = true ]
then
    echo Summary: FAILURE
    exit 1
else
    echo Summary: SUCCESS
    exit 0
fi

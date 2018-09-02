#!/usr/bin/env bash

test_group=$1
project_path=$PWD
source=$project_path/src/main/cpp/$test_group.cpp
executable=$project_path/build/cpp/$test_group.out
resources=$project_path/src/test/resources

g++ $source -o $executable

test_cases=`cd $resources/$test_group && ls`

failed=false
for test_case in $test_cases
do
    test_case_directory="$resources/$test_group/$test_case"
    input=`cat $test_case_directory/input.txt`
    expected_output=`cat $test_case_directory/output.txt`
    actual_output=`echo $input | $executable`

    if [[ $expected_output = $actual_output ]]
    then
        echo "PASSED: $test_case"
    else
        failed=true
        echo "FAILED: $test_case: On input [$input] was [$actual_output] but expected [$expected_output]."
    fi

done

if [ $failed = true ]
then
    exit 1
else
    exit 0
fi

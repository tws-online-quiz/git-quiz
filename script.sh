#!/bin/bash -e
master_branch=$(git branch | grep master)
test_branch=$(git branch | grep test)

if [[ ! -n $master_branch  &&  ! -n $master_branch ]]; then
    echo "分支不存在!";
    exit 1;
fi

git checkout master
if [ ! -f master.txt ]; then
    echo "master.txt不存在!";
    exit 1;
fi

master_commit_count=$(git rev-list --count master)

if [ $master_commit_count  -lt 2 ]; then
    echo "master commit数量不足2!";
    exit 1;
fi

git checkout test
if [ ! -f test.txt ]; then
    echo "test.txt不存在!";
    exit 1;
fi

test_commit_count=$(git rev-list --count test)

if [ $test_commit_count  -lt 2 ]; then
    echo "test commit数量不足2!";
    exit 1;
fi

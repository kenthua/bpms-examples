#!/bin/bash

BPMDESIGN_PORT=8080
BPMDESIGN_HOST=bpmdesign
BPMDEV_PORT=8080
BPMDEV_HOST=bpmdesign
BPMTEST_PORT=8080
BPMTEST_HOST=bpmtest
BPMQA_PORT=8080
BPMQA_HOST=bpmqa
BPM_COUNT=0
TEST_TEXT="Red Hat JBoss BPM Suite :: Business central"

until [ $BPM_COUNT  == 4 ]; do
BPM_COUNT=0
printf "Checking bpm docker environment...\n"
BPMDESIGN=`curl --silent $BPMDESIGN_HOST:$BPMDESIGN_PORT/business-central/login? | grep -oPm1 "(?<=title>)[^<]+" | grep "$TEST_TEXT" | wc -l`
if [[ $BPMDESIGN == "1" ]]
then
	printf "$BPMDESIGN_HOST:$BPMDESIGN_PORT - BPM Design Up\n"
	let BPM_COUNT+=1
else
	printf "$BPMDESIGN_HOST:$BPMDESIGN_PORT - BPM Design Loading or Failed\n"
fi

BPMDEV=`curl --silent $BPMDEV_HOST:$BPMDEV_PORT/business-central/login? | grep -oPm1 "(?<=<title>)[^<]+" | grep "$TEST_TEXT" | wc -l`
if [[ $BPMDEV == "1" ]]
then
        printf "$BPMDEV_HOST:$BPMDEV_PORT - BPM Dev Up\n"
	let BPM_COUNT+=1
else
        printf "$BPMDEV_HOST:$BPMDEV_PORT - BPM Dev Loading or Failed\n"
fi

BPMTEST=`curl --silent $BPMTEST_HOST:$BPMTEST_PORT/business-central/login? | grep -oPm1 "(?<=<title>)[^<]+" | grep "$TEST_TEXT" | wc -l`
if [[ $BPMTEST == "1" ]]
then
        printf "$BPMTEST_HOST:$BPMTEST_PORT - BPM Test Up\n"
	let BPM_COUNT+=1
else
        printf "$BPMTEST_HOST:$BPMTEST_PORT - BPM Test Loading or Failed\n"
fi

BPMQA=`curl --silent $BPMQA_HOST:$BPMQA_PORT/business-central/login? | grep -oPm1 "(?<=<title>)[^<]+" | grep "$TEST_TEXT" | wc -l`
if [[ $BPMQA == "1" ]]
then
        printf "$BPMQA_HOST:$BPMQA_PORT - BPM QA Up\n"
	let BPM_COUNT+=1
else
        printf "$BPMQA_HOST:$BPMQA_PORT - BPM QA Loading or Failed\n"
fi
printf "Sleeping 5 seconds\n"
sleep 5
done

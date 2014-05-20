#!/bin/sh
# x="/foo/fizzbuzz.bar.quux"
# y=${x%.*}
# echo $y

baseFileName=${i$1%.*}
echo $y

#selectedFileName=$1
#tempfile="${selectedFileName##*/}"
#baseFileName=`echo "${tempfile%.*}"`
#echo "selectedFileName:" $selectedFileName
echo "baseFileName: " $baseFileName

prochtml=`./HTML2XML.sh < $baseFileName.proc.html`
taskhtml=`./HTML2XML.sh < $baseFileName.task.html`

cp $baseFileName.bpmn $baseFileName.bpmn.tmp

#Linux Use this:
replace -v "%PROCFORM%" "$prochtml" -- $baseFileName.bpmn.tmp
replace -v "%TASKFORM%" "$taskhtml" -- $baseFileName.bpmn.tmp
cp $baseFileName.bpmn.tmp $baseFileName.bpmn20.xml

##Depricated Linux code
#awk -v var="${prochtml}" '{sub(/%PROCFORM%/,var)}1' $baseFileName.bpmn > $baseFileName.bpmn.tmp
#awk '{gsub(/%PROCFORM%/,$prochtml)}1' $baseFileName.bpmn #> $baseFileName.bpmn.tmp
#awk '{sub(/%TASKFORM%/,$taskhtml)}1' $baseFileName.bpmn.tmp > $baseFileName.bpmn20.xml

##MacOS Use this:
#awk -v var="${prochtml//$'\n'/\\n}" '{sub(/%PROCFORM%/,var)}1' $baseFileName.bpmn > $baseFileName.bpmn.tmp
#awk -v var="${taskhtml//$'\n'/\\n}" '{sub(/%TASKFORM%/,var)}1' $baseFileName.bpmn.tmp > $baseFileName.bpmn20.xml

rm $baseFileName.bpmn.tmp
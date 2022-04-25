#!/bin/bash -x

isPartTime=1
isFullTime=2
maxHrsInMonth=100
empRatePerHr=20
numOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkingHrs()
{
        case $1 in
                        $isPartTime )
                                empHrs=4
                        ;;
                        $isFullTime )
                                empHrs=8
                        ;;
                        *)
                                empHrs=0
                        ;;
        esac
}
function getEmpWage()
{
        echo $(($1*$empRatePerHr))

}

while [[ $totalEmpHr -lt $maxHrsInMonth &&
        $totalWorkingDays -lt $numOfWorkingDays ]]
do
        ((totalWorkingDays++))
        getWorkingHrs $((RANDOM%3))
        totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWage["$totalWorkingDays"]=$(($empHrs*$empRatePerHr))
done

totalSalary="$( getEmpWage $totalEmpHr )"
echo ${dailyWage[@]}	#Display all array elements

echo ${!dailyWage[@]} 	#Display all Dictionary elements
echo ${#dailyWage[@]} 	#Display number of elements in Dictionary

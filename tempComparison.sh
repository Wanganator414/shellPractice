#!/bin/bash
#Switched to using BASH instead of SH since I wanted to use the bash built-in 'let' or I can use (()) instead
#Some variables etc

LBLUE='\033[1;36m'
LPURPLE='\033[1;35m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color
text_color="${NC}"
count_down_timer="1"

export sensors_result=$(sensors) #Export variable so child processes can modify it

# core_0_temp=`sensors | egrep "^Core 0" | tr -s [:space:] ":" | cut -d':' -f3 | tr -d + | tr -d "°C"`
# core_1_temp=`sensors | egrep "^Core 1" | tr -s [:space:] ":" | cut -d':' -f3 | tr -d + | tr -d "°C"`
# package_temp=`sensors | egrep "^Package" | cut -d" " -f5 | tr -d [:alpha:] | tr -d "+" | tr -d "°"`
# cpu_temp=`sensors | egrep -A2 "^pch_sky" | egrep "temp" | tr -d [:alpha:] | tr -d [:space:] | tr -d "+" | tr -d "°"`

#?It is important to initialize some values since I will be doing arithmetic with it, I do not want null values that might create errors
export core0_total="0"
export core1_total="0"
export package_total="0"
export cpu_total="0"
export time_length="3"

#GRabbed progress bar snippet from the inter webs
function ProgressBar() {
    # Process data  #Var 1 is start Var 2 is finish
    let _progress=(${1} * 100 / ${2} * 100)/100
    let _done=(${_progress} * 4)/10
    let _left=40-$_done
    # Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

    # 1.2 Build progressbar strings and print the ProgressBar line
    # 1.2.1 Output example:
    # 1.2.1.1 Progress : [########################################] 100%
    if [ ${_progress} -eq "100" ]; then
        printf "\r${RED}Progress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
    fi
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

echo -e "\nThis script is just for lols and checks if ur laptop average temps changes depending on where you put it.\n
Displays average temperature readings of specified time frame after timer runs out.\n"

echo -ne "Enter how long ${GREEN}(seconds) ${NC}you want to inspect temps for: "
read time_length
echo -e ""

#Checks for valid user input (integers only)
while :; do
    echo -e "You entered: ${time_length}\n"
    if [[ $time_length ]] && [ $time_length -eq $time_length ] 2>/dev/null; then
        break
    else
        echo -e "Invalid value! ${RED}Integers ONLY\n${NC}Enter another: "
        read time_length
    fi
done

for count_down_timer in $(#Using a for loop and seq as a range generator
    seq ${count_down_timer} ${time_length}
); do

    ProgressBar ${count_down_timer} ${time_length} #Well, scraping old janky countdown timer for fancier progress bar readily available

    # if [ ${count_down_timer} -eq "1" ]; then
    #     echo -e "|${text_color}${count_down_timer}|"
    # fi

    # if [ ${count_down_timer} -gt "9" ]; then
    #     echo -ne "|${text_color}${count_down_timer}\r\b\b|"
    # fi

    # if [ ${count_down_timer} -le "5" ] && [ ${count_down_timer} -gt "1" ]; then
    #     text_color="${RED}"
    #     echo -ne "|${text_color}${count_down_timer}\b\b|" # Big brain trick to use -ne to prevent trialing newline and carriage return to move back up
    # else
    #     text_color="${NC}"
    #     echo -ne "|${text_color}${count_down_timer}\b\b|" # Big brain trick to use -ne to prevent trialing newline and carriage return to move back up
    # fi

    let "count_down_timer=count_down_timer+1"

    #Do NOT use variable syntax like {} or $ while using "let" or (())

    export sensors_result=$(sensors)

    temp_holder=$(echo -e "${sensors_result}" | egrep '^Core 0' | tr -s [:space:] ':' | cut -d':' -f3 | tr -d + | tr -d '°C')
    #!Use temp variable to reduce clutter, use $() instead of eval, since eval evaluates stuff arg by arg and often times is a security hazard, $() doe all at once

    #?Bash's expr doesn't directly support floating point arithmetic, but there are a couple of external tools you can use, like awk, python, and bc
    export core0_total=$(echo ${core0_total}+${temp_holder} | bc)
    #!$(()) is same as using expr, but in this case I will use bc(basic calculator) instead, also use export to pass down to other subprocess

    temp_holder=$(echo -e "${sensors_result}" | egrep '^Core 1' | tr -s [:space:] ':' | cut -d':' -f3 | tr -d '+C°')

    export core1_total=$(echo ${core1_total}+${temp_holder} | bc)

    #Note that echo -e and quotes are needed to preserve formatting of original output

    temp_holder=$(echo -e "${sensors_result}" | egrep '^Package' | cut -d' ' -f5 | tr -d [:alpha:] | tr -d '+°')

    export package_total=$(echo ${package_total}+${temp_holder} | bc)

    temp_holder=$(echo -e "${sensors_result}" | egrep -A2 '^pch_sky' | egrep 'temp' | tr -s [:space:] ' ' | cut -d' ' -f2 | tr -d '+°C')

    export cpu_total=$(echo ${cpu_total}+${temp_holder} | bc)

    sleep 1
done

# echo -e "${GREEN}${sensors_result}"
echo -e "\n"
echo -e "${GREEN}Average core0 temp:\t$(echo ${core0_total}/${time_length} | bc)C"
echo -e "${RED}Average core1 temp:\t$(echo ${core1_total}/${time_length} | bc)C"
echo -e "${LPURPLE}Average cpu casing temp:\t$(echo ${package_total}/${time_length} | bc)C"
echo -e "${LBLUE}Average manufacturer provided cpu temp:\t$(echo ${cpu_total}/${time_length} | bc)C"
#!/bin/bash

# Define the base command and directory
COMMAND="./build/ADRouter"
DIRECTORY="/DATA/darren/PCB/PCB-ADR-Routing/case/"
timed_out=200

# Arrays to keep track of successful and timed out commands
successful_commands=()
timed_out_commands=()
# Loop through numerical arguments from 2 to 6
for i in {1..7}
do
    timeout ${timed_out}s $COMMAND $DIRECTORY $i
    if [ $? -eq 0 ]; then
        successful_commands+=("$i")
    else
        timed_out_commands+=("$i")
        echo "Command with parameter $i timed out and was killed."
    fi
done

# Execute command with string arguments
for arg in b_01 b_02 b_03 b_04 b_05 b_06 b_07 b_08 b_09 b_10
do
    timeout ${timed_out}s $COMMAND $DIRECTORY $arg
    if [ $? -eq 0 ]; then
        successful_commands+=("$arg")
    else
        timed_out_commands+=("$arg")
        echo "Command with parameter $arg timed out and was killed."
    fi
done

# Output the summary
echo "Summary of execution:"
echo "Successful commands: ${successful_commands[*]}"
echo "Timed out commands: ${timed_out_commands[*]}"

# #!/bin/bash

# # Define the base command and directory
# COMMAND="./build/ADRouter"
# DIRECTORY="/DATA/darren/PCB/PCB-ADR-Routing/case/"
# timed_out=200

# # Arrays to keep track of successful and timed out commands
# successful_commands=()
# timed_out_commands=()

# # Function to execute command with timeout
# execute_command() {
#     local param=$1
#     timeout ${timed_out}s $COMMAND $DIRECTORY $param
#     if [ $? -eq 0 ]; then
#         echo "success $param"
#     else
#         echo "timeout $param"
#     fi
# }

# export -f execute_command
# export COMMAND
# export DIRECTORY
# export timed_out

# # Create a list of parameters to be processed
# params=()
# for i in {1..7}; do
#     params+=("$i")
# done
# for arg in b_01 b_02 b_03 b_04 b_05 b_06 b_07 b_08 b_09 b_10; do
#     params+=("$arg")
# done

# # Use GNU Parallel to run the commands in parallel
# parallel execute_command ::: "${params[@]}" | while read -r result param; do
#     if [ "$result" == "success" ]; then
#         successful_commands+=("$param")
#     else
#         timed_out_commands+=("$param")
#         echo "Command with parameter $param timed out and was killed."
#     fi
# done

# # Output the summary
# echo "Summary of execution:"
# echo "Successful commands: ${successful_commands[*]}"
# echo "Timed out commands: ${timed_out_commands[*]}"

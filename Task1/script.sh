#!/bin/bash
print_separator() {
    terminal_width=$(tput cols) 
    printf "%${terminal_width}s\n" | tr ' ' '-'
}

#need to have curl installed (apt-get install curl -y)

#1. Print the home directory
print_home_directory() {
    echo "Home directory:"
    print_separator
    pwd
    echo
}

#2. List all usernames from the passwd file
list_usernames() {
    echo "Usernames from passwd file:"
    print_separator
    cut -d: -f1 /etc/passwd
    echo
}

#3. Count the number of users
count_users() {
    echo "Number of users:"
    print_separator
    echo "$(cut -d: -f1 /etc/passwd | wc -l)"
    echo
}

#4. Find the home directory of a specific user (prompt to enter the username value)
find_user_home_directory() {
    read -p "Enter username to find home directory: " username
    echo "Home directory of user '$username':"
    print_separator

    if grep -q "^$username:" /etc/passwd; then
        grep "^$username:" /etc/passwd | cut -d: -f6
    else
        echo "User '$username' does not exist."
    fi

    echo
}

#5. List users with specific UID range (e.g. 1000-1010)
list_users_by_uid_range() {
    echo "Users with UID range 1000-1010:"
    print_separator
    awk -F: '$3 >= 1000 && $3 <= 1010 { print $1 }' /etc/passwd
    echo
}

#6. Find users with standard shells like /bin/bash or /bin/sh
find_users_with_standard_shells() {
    echo "Users with standard shells (/bin/bash or /bin/sh):"
    print_separator
    awk -F: '$NF ~ /(\/bin\/bash|\/bin\/sh)$/ { print $1 }' /etc/passwd
    echo
}

#7. Replace the “/” character with “\” character in the entire /etc/passwd file and redirect the content to a new file
replace_slashes_in_passwd_file() {
    echo "Replacing '/' with '\' in /etc/passwd file..."
    print_separator
    sed 's/\//\\/g' /etc/passwd > passwd_modified.txt
    echo "Content replaced and saved to passwd_modified.txt"
    echo
}

#8. Print the private IP
print_private_ip() {
    echo "Private IP:"
    print_separator
    hostname -I | awk '{print $1}'
    echo
}

#9. Print the public IP
print_public_ip() {
    echo "Public IP:"
    print_separator
    curl -s ifconfig.me
    echo
    echo
}

#10 & 11. Switch to john user (and print the home directory of john user)
switch_to_john_user_and_print_home_directory() {
    echo "Switching to john user and printing home directory:"
    print_separator
    su john -c pwd
    echo
}



if [ $# -eq 0 ]; then
    echo "Error: Please provide a filename as an argument."
    exit 1
fi

filename=$1

# Check if the provided filename is "passwd"
if [ "$filename" != "passwd" ]; then
    echo "File name is not 'passwd'! "
    exit 1
fi

print_home_directory
list_usernames
count_users
find_user_home_directory
list_users_by_uid_range
find_users_with_standard_shells
replace_slashes_in_passwd_file
print_private_ip
print_public_ip
switch_to_john_user_and_print_home_directory
# Task 1 - /etc/passwd file manipulation

As specified, I pulled the ubuntu image using "docker pull ubuntu" and created the container with "docker run -it --name my_linux_container ubuntu".

After this, for my convenience, I cloned the Useful-Resources repo and copied the file to the docker container using "docker cp C:\Users\timia\Desktop\Useful-Resources\1-linux\create_large_file.sh my_linux_container:/home" placing the "create_large_file.sh" file in the home directory of the container.

To interact with the running container again I used "docker exec -it my_linux_container /bin/bash" command.

I created the user john using "adduser john".

I ran the file copied from the github repository, but I got an error, this is the **first problem** I ran into:
![Run script Error](https://github.com/TimiAndrei/Assignment/blob/21b1af2383064e02f304d4629ce861005386286d/Task1/screenshots/1.5%20error.png)

**Fix:** Being on a windows host machine, the cmd has some differences in interpreting some symbols like the endline character so I used the
dos2unix package to fix this. I first installed it "apt-get install dos2unix" and called the dos2unix function with my file as argument "dos2unix create_large_file.sh" then ./create_large_file.sh worked.

It worked, but in line 5 there was a typo, this being the **second problem**, but the **fix** was simple so I changed "lage_file" to "large_file" and after the modification, it ran without problems.
![Script execution](https://github.com/TimiAndrei/Assignment/blob/21b1af2383064e02f304d4629ce861005386286d/Task1/screenshots/1.6%20executed%20file%20after%20modification.png)

I created the script file "script.sh" and followed the guidelines. While making the script, the only **problem** I ran into was trying to make the 10 and 11 commands separately. I ended up combining them using "su john -c pwd". At first, the process was going to wait for the new console opened at the user switch to close,so if the user didn't type "exit", the script wasn't executing the last command and even after executing, the user would exit the john home directory and get back to root, which isn't what we initially wanted.
Note: for the script to work, it needs curl installed, I used it to convert the private IP to public IP with ifconfig.me

The output of the Script looks like this:
![My script output 1](https://github.com/TimiAndrei/Assignment/blob/21b1af2383064e02f304d4629ce861005386286d/Task1/screenshots/1.8%20script_output_1.png)

![My script output 2](https://github.com/TimiAndrei/Assignment/blob/21b1af2383064e02f304d4629ce861005386286d/Task1/screenshots/1.8%20script_output_2.png)

The /etc/passwd file modified in step 7 looks like this:
![/etc/passwd file modified](https://github.com/TimiAndrei/Assignment/blob/21b1af2383064e02f304d4629ce861005386286d/Task1/screenshots/1.9%20passwd_modified.txt%20output.png)

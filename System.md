# System

1. In what file can you find the installed version of your Debian?

    - `../usr/lib/os-release`
    
    - I am using WSL with Ubuntu, so maybe different on macOS

2. What command can you use to rename your system?

    - `sudo hostname new`

3. What file has to be modified to make it permanent?
    
    -  `/etc/hostname`

4. What command gives you the time since your system was last booted?
    
    -  `who -b` (should work, but has no output on my machine)
    
    - `uptime -s`

5. Name the command that determines the state of the SSH service.
    
    -  `sudo service ssh status`

6. Name the command that reboots the SSH service.
    
    - `sudo service sshd restart`

7. Figure out the PID of the SSHD service.

    - `ps`: shows a list of current processes

    - `pgrep`: shows the grep result of pid 
    
    - `cat /var/run/sshd.pid` (from online github, but I am not running sshd so cannot tell)

    - The main difference is that `sshd` is a server (like a web server serving https) and `SSH` is a client (think of a web browser)

8. What file contains the RSA keys of systems that are authorized to connect via SSH?

    - `/etc/ssh`
        
        - Should be one of the files 

9. What command lets you know who is connected to the System?
    
    -  `w`: Show who is logged on and what they are doing on Linux

    - `who`: Display information about Linux users who are currently logged in (never worked for me on Windows WSL)

10. Name the command that lists the partition tables of drives?

    - The partition table divides the disk into segments / sectors

    - `fdisk -l`

11. Name the command that displays the available space left and used on the system in an humanly understandable way

    - `df -h`

    - `du` is used to estimate file space usage—space used under a particular directory or files on a file system.
 
    - `df` is used to display the amount of available disk space for file systems on which the invoking user has appropriate read access.

12. Figure out the exact size of each folder of /var in a humanly understandable way followed by the path of it.

13. Name the command that find, in real time, currently running processes

14. Run the ‘tail -f /var/log/syslog‘ command in background

15. Find the command that kills the background command’s process

16. Find the service which makes it possible to run specific tasks following a regular schedule

17. Find the command that allows you to connect via ssh on the VM.(In parallel with the graphic session)

18. Find the command that kills ssh service

19. List all services which are started at boot time and name this kind of services

20. List all existing users on the VM

    - `cat /etc/passwd`

21. List all real users on the VM

    - Human users have UIDs starting at 1000, so you can use that fact to filter out the non-humans:

    - `cut -d: -f1,3 /etc/passwd | egrep ':[0-9]{4}$' | cut -d: -f1`

    - Achieves the same output: `awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd`

22. Find the command that add a new local user

    - `adduser`

23. Explain how connect yourself as new user. (With graphic session and ssh session)
    
    - Graphics session: (reboot if necessary) login as the new user on boot and password as prompted

    - SSH session: `ssh [root / username]@[ip address, e.g. 192.168.0.156]`

24. Find the command that list all packages
    - `apt list --installed`

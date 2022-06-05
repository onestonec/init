# init

This first project, `init`, will give you the opportunity to discover system and network
basic commands, many of the services used on a server machine, as well as a few ideas of
scripts that can be useful for SysAdmins on a daily basis.

1. Get the list of the network interfaces of the machine without displaying any detail
for these interfaces. Only the list of names.

    - `ifconfig -a | sed 's/[ \t].*//;/^$/d'`
    
    - `ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d'`

2. Identify and display the Ethernet interface characteristics:
    
    (a) Identify broadcast address
        - 172.28.159.255
        - `ifconfig [device name, in this case eth0] | grep broadcast | awk '{print $6}'`
    
    (b) Identify all IP adresses which are part of the same subnet


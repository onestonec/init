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

3. Identify the MAC address of the Wi-Fi card
    
    - `ifconfig en1 | awk '/ether/{print $2}' `
    
    - I don't have a wifi card
    
    - But `en1` should be the name of the wifi card in `ifconfig`

4. Identify the default gateway in the routing table
    
    - `route`

5. Identify the IP address of the DNS that responds to any url

    - `nslookup [url]`
       
       - `nslookup` - query Internet name servers interactively  
    
    - `dig [url]`
        - Just the IP address: `dig slash16.org | grep SERVER | awk '{print $3}' | awk -F '[()]' '{print $2}'`
            
            - `dig` is used to query DNS for slash16.org
            
            - The IP address i located in the server part
            
            - `awk -F '[()]' '{print $2}'` will extract values between brackets '()'
            
            - The `-F` fs option defines the input field separator to be the regular expression fs

6. Get the complete path of the file that contains the IP address of the DNS server you’re using

    - `/run/resolvconf/resolv.conf`

7. Query an external DNS server on the slash16.org domain name (ie. : google 8.8.8.8)
    
    - `dig [url]` 
    - `nslookup [url]`

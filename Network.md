# Network


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

8. Find the provider of slash16.org (or any url, slash16.org is no longer in existence)
    
    - `dig [url]` / `nslookup [url]`: to find the DNS
    
    - `whois [ip of the DNS server]`

9. Find the external IP of 42.fr
    
    - `tracepath [url]`

10. Identify the network devices between your computer and the slash16.org domain
    
    - `tracepath [url]`  (tracert in mac)

11. Use the output of the previous command to find the name and IP address of the
device that makes the link between you (local network) and the outside world

    - `tracepath -b [url]` (tracert in mac) 

12. Find the IP that was assigned to you by dhcp server

    - `ip -4 addr` (Because I am using Linux)

    - `dig +short myip.opendns.com @resolver1.opendns.com`: determines the public IP address

13. Thanks to the previous question and the reverse DNS find the name of your host

    - `hostname` (Not sure about this one)

14. What file contains the local DNS entries?

    - `/etc/hosts`  

15. Make the intra.42.fr address reroute to 46.19.122.85
    
    - `echo '46.19.122.85	intra.42.fr' >> /etc/hosts`

    - You will need superuser right to do this, but I am not going to 

---

- `dig` uses the OS resolver libraries. `nslookup` uses is own internal ones.

   - `nslookup` is deprecated 
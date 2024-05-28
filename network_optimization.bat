@echo off

echo Flushing DNS cache...
ipconfig /flushdns

echo Releasing IP address...
ipconfig /release

echo Renewing IP address...
ipconfig /renew

echo Resetting Winsock...
netsh winsock reset

echo Resetting IP stack...
netsh int ip reset

echo Displaying current IP configuration...
ipconfig /all

echo Clearing ARP cache...
netsh interface ip delete arpcache

echo Resetting network interfaces...
netsh interface set interface "Ethernet" admin=disable
netsh interface set interface "Ethernet" admin=enable

echo Resetting TCP/IP stack...
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global rss=enabled

echo Network optimization complete. A restart is recommended to apply all changes.
pause
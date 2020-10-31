echo "Welcome to the tcp_dump_script. This script makes using tcpdump easy."

echo "Options for the this script"
echo "		1) Only TCP conections"
echo "		2) TCP connections and a specific TCP port"
echo "		3) Specific host and a specific port "

#a new line for spacing between commands and arrangement in display
echo " "

echo -n "Enter a number for one of the options listed: >"
#this variable stores the options selected to match against case
read option

case $option in
1)
	echo -n "Please enter the file name or file directory! : >";
	#capture file name or directory
	read file_name
	#checks wether file exists and is readable
	if [ -r $file_name ]; then

		#the command for tcpdump that perform case 1 and pipe it to less command for paging control
		tcpdump -n -XX tcp -r $file_name | less;
	fi
;;

2)
	echo -n "Please enter the file name or file directory! : >";
	#capture file name or directory
	read file_name
	echo -n "Please enter the tcp port! : >";
	#the port number to be checked in tcp dump command
	read port_no

	#checks whether the file exists/is readable and the port number variable is not left empty
	if [ -r $file_name ] && [ -n $port_no ]; then

		#the command for tcpdump that perform case 2 and pipe it to less command for paging control
		tcpdump -n -XX tcp port $port_no -r $file_name | less;
	fi
;;

3)
	echo -n "Please enter the file name or file directory! : >";
	#capture file name or directory
	read file_name
	echo -n "Please enter the host's IP address! : >";
	#host's ip address to check in tcp dump command
	read ip_addr
	echo -n "Please enter the host's port number! : >";
	#the port number to be included in tcp dump command
	read port_no

	#checks whether the file exists/is readable and the port number variable is not left empty
	if [ -r $file_name ] && [ -n $port_no ]; then

		#the command for tcp dump that performs case 3 and pipe it to the less command for paging control
		tcpdump -n -XX host $ip_addr and tcp port $port_no -r $file_name | less;
	fi
;;
esac

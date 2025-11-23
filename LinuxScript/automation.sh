#!/usr/bin/bash

#set -x

read -p "Enter your username : " username 

if [ "$username" != "developer" ]; then 
	echo -e "\aIncorrect username , Please restart the script by pressing CTRL + C "
fi
	

read -s -p "Enter your password : " password 

if [ "$password" != "C1sco12345" ]; then 
	echo -e "\n\aIncorrect password, Please restart the script by pressing CTRL + C "
fi 

echo -e "\n"
echo "Please enter the server details : "
read -p "Enter the url (Server address) : " url
read -p "Enter the port number : " port

#$((port))

read -p "Do you want to save the output (Enter yes or no): " save
if [[ "$save" == "yes" || "$save" == "y" ]]; then
    read -p "Please enter the output file name (without extension): " output
    read -p "Please specify the file type (json/txt): " file
    echo "Saving output to $output.$file ..." #its just prints 

    curl -k -u "$username:$password" \
        -H "Accept: application/yang-data+json" \
        -X GET \
        "https://$url:$port/restconf/data/Cisco-IOS-XE-native:native/hostname" \
        -o "${output}_hostname_cat8kv.$file"

    curl -k -u "$username:$password" \
        -H "Accept: application/yang-data+json" \
        -X GET \
        "https://$url:$port/restconf/data/Cisco-IOS-XE-interfaces-oper:interfaces" \
        -o "${output}_interfaces_cat8kv.$file" 
    curl -k -u "$username:$password" \
          -H "Accept: application/yang-data+json" \
          -X GET \
          "https://$url:$port/restconf/data/Cisco-IOS-XE-process-cpu-oper:cpu-usage" \
          -o "${output}_cpu_utilization_cat8kv.${file}"
          
	echo "---You can find the output files inside AutomationP1>LinuxScript directory---"
          
#keeping the same output file name for different output is not a good practice as the later one will over write the previous one . So , for hostname it will be saved as output_hostname and as output+interfaces for interface description.

elif [[ "$save" == "no" || "$save" == "n" ]]; then
    echo "Printing output directly..."

    echo "---- Hostname ----"
    curl -k -u "$username:$password" \
        -H "Accept: application/yang-data+json" \
        -X GET \
        "https://$url:$port/restconf/data/Cisco-IOS-XE-native:native/hostname"

    echo -e "\n---- Interfaces ----"
    curl -k -u "$username:$password" \
        -H "Accept: application/yang-data+json" \
        -X GET \
        "https://$url:$port/restconf/data/Cisco-IOS-XE-interfaces-oper:interfaces"
    echo "\n---- CPU UTILIZATION ----"
    curl -k -u "$username:$password" \
          -H "Accept: application/yang-data+json" \
          -X GET \
          "https://$url:$port/restconf/data/Cisco-IOS-XE-process-cpu-oper:cpu-usage" \

else 
    echo "\aWrong input. Please re-run the script and enter yes or no."
fi


	
	     
     


# API Testing on Cisco IOS XE Sandbox using cat8kv using Postman, cURL script.


This project automates **network device monitoring and configuration using RESTCONF
APIs** on Cisco IOS XE on cat8kv. Here **Postman is used to perform the CRUD operations**.**A bash script
using cURL tool is used to fetch system health or operational data and other configurational data**. The
goal is to demonstrate practical network programmability using Restconf APIs and the pros of network
automation in real life environment.

---

## Tools and Technologies used:

  -  `Restconf API`
  -  `Linux Scripting using cURL`
  -  `Openconnect for VPN connection`
  -  `Postman`
  -  `Cisco Yangsuite for analyzing yang modules`
  -  `SSH for remote login and manual verification`
  -  `Cisco IOS XE on cat8kv sandbox`
  -  `JSON data format`

---

## Yang Modules Used:

  - `Cisco-IOS-XE-processes-cpu-oper`
  - `ietf-interfaces`
  - `Cisco-IOS-XE-interfaces-oper`

---


## Project Blueprint :

        Client(Postman , Linux Script)
            API endpoint(Client)
                  |
                  |
            RESTCONF API CALL
                  |
                  |
            API endpoint(Device)
    Network Devce (Cisco IOS XE on Cat8kv)


---


### API call lifecycle :

1. The user initiates a Postman API call or run the Linux script
2. The client sends RESTCONF API call via HTTP
3. The Device checks for user authorization.
4. If the user is authorized, the device responds with valid outputs.
5. If the user is not authorized, the device ignores the call.


---


## Project Workflow :
1. Reserve Cisco IOS XE on Cat8kv sanbox available on cisco sandbox .
2. After the environment is live , its time to create the VPN tunnel .
3. For VPN connection , openconnect tool is used .
4. After the VPN connection is set up , we need to setup our lab environment .
5. Login to Cisco Yangsuite , import the device and all its supported YANG modules to take
reference .
6. Setup Cisco Yangsuite , by enabling Netconf , Restconf and SSH on the device .
7. Load all the required Yang Modules thats going to be used , to analyse the modules .
8. In protocol section , under the Restconf section , load all the Yang modules and generate the API
  calls as per requirements .
9. Create the required Postman environment and variables.
10. Use base64 authorization in Postman , as base64 is only supported in cisco sandbox .
11. Take reference of all the required API call , from Yangsuite and use it in Postman.
12. After the calls are successfully made , we can save the response to a file .
13. Now to fetch data automatically we will create a Linux script using cURL.
14. For the URL we will again take reference from Yangsuite.
15. We can create our script as per our business requirements.


---


## Challenges Faced and their solutions : 

1. Syntax issues with cURL , each line ends with “ \ ” and nothing else after it and no “ \ ” at the
final line. Without this bash thinks each line is a new command and throws error.
2. While working with IETF yang modules, we can face some keyword issues which is not shown in
yangsuite . For e.g. “subnet ” in IETF modules is not accepted by Cisco IOS XE on cat8kv,
instead can be replaced with the keyword “netmask”.
3. We should create fresh environments and variables in Postman , or else old environments and
variables may override the new ones and cause connectivity issues.

---


## Future Enhancements:

1. Integration of Python Scripts and Netconf can be done. Netconf is more modular and versatile than
RESTCONF.
2. Grafana can be used for CPU utilization of the network devices.
3. Integration of Machine Learning can be done to create a predictive and responsive model.
4. Integration of several Python libraries can be done.

---


## Author : 

**Raj Pallab Deka**  
💼 Current Role: [Network Field Engineer], [Coforge] , [Under government NIC-NKN project]  
🌐 Network Automation & Cybersecurity Enthusiast  
🔗 GitHub: [https://github.com/RajPallabDeka  ](https://github.com/RajPallabDeka)
🔗 LinkedIn: [https://www.linkedin.com/in/your-profile](https://www.linkedin.com/in/raj-pallab-deka-604b33276?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)

---

⭐ If you like this project, consider giving the repository a **star** — it helps the profile stand out!



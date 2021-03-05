Migration from Caché to IRIS can be quite a challenge if your code is grown over many years    
and probably not so clean structured as you may like it. So you face the need to check your  
migrated code against some reference data. A few samples might not be a problem,   
but some hundred GB of data for testing might be.  

A possible step could be to have your fresh code in IRIS but leave your huge datastore on Caché  
and connect both environments over ECP.  I have created a demo project that gives you the   
opportunity to try this based on 2 Docker images with IRIS and with Caché connected over ECP.    

__Attention:__  
- Both Docker images require a personal license for MultiServer to enable ECP   
- The default Community License doesn't allow ECP and can't be used for Caché.  
As a customer with a support contract, you may get loan licenses directly from WRC.  

__Scenario:__   
  
 Caché acts as ECP Server while IRIS acts as ECP Client.  
 In IRIS you have a namespace SAMPLES.  
 Globals are in remote database SAMPLES on Caché  
 Routines (and Classes) are in database USER    
 The classes were just migrated by drag/drop from Cashé Studio to Iris Studio  
 Data-Globals are in remote database SAMPLES on Caché  
 
 This setup allows you to have local data in namespace USER  
 and remote data in namespace SAMPLES and run your test queries or other exercises.  

__Installation for Caché:__  
- Get the external IPV4 address of the machine that runs your docker environment (example =**_10.10.1.99_** )   
This is required to establish access between both containers  
- Download CrossECP-Caché from OEX  
Copy your (loan) license key into cache.key   
- From the download directory run:   
__docker-compose up -d --build__    and you are done with Caché.   
It uses -p __41773__:1972 for the Caché super server and -p __42773__:57772  for the webserver    
Your actual directory is mapped to __/external__ to allow file exchange with docker environment  

- Next proceed to CrossECP-IRIS from OEX   

[Article in DC](https://community.intersystems.com/post/using-ecp-across-iris-and-cach%C3%A9)

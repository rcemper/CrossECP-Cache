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
 Caché acts as ECP Server while IRIS acst as ECP Client   
- Get the external IPV4 address of the machine that runs your docker environment (example = 10.10.1.99 )   
This is required to establish access between both containers  
- Copy your (loan) license key into cache.key Download CrossECP-Caché from OEX 
From the download directory run:  docker-compose up -d --build    and you are done with Caché.     It uses ports  '41773:1972' for the Caché super server and   '42773:57772' for  the webserver     Your actual directory is mapped to /external to allow file exchange with docker environment    
Next Download CrossECP-IRIS from OEX Copy your (loan) license key into iris.key
From the download directory run:  docker-compose up -d --build     It uses these port mapings  -p '45773:1972' -p '46773:52773'  -p '47773:53773' Your actual directory is mapped to /external to allow file exchange with docker environment
to complete installation and start operation run: docker-compose exec iris iris session iris initECP Server status 1 Not Connected Continue anyway ? (nNyY) [Y]: Y Enter Host-IP-Adress of Docker (nn.nn.nn.nn) [192.168.0.6]: 10.10.1.99        Connect to ECP sever on 192.168.0.6 now ? (nNyY) [Y]: Y Server status 5 Normal
Of course, you can do this list step also from SMP  System > Configuration > ECP Settings > ECP Data Servers  
This last step is just for your comfort.

Result:

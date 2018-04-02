### Basic Building Docker Commands 
	#  . indicates current folder, you should run only where docker file is present
	docker build -t docker-tomcat:1.0 .  # equivalent of compiling
	docker images
	
### Basic Running Commands	
	docker run -d -p 8080:8080 -p 8100:8100 docker-tomcat:1.0  # running the code
	docker exec -it containerid /bin/bash
	docker ps
	docker kill <containerid>
	
	
	To go inside the container and check the html file
	docker exec -it 5dabed814270 /bin/bash
### READ
        https://docker-curriculum.com/	
        
        


## Delete all containers
    docker rm $(docker ps -a -q)
## Delete all images
    docker rmi $(docker images -q)


### Output

    Go to http://localhost:8080/project/ in browser
    
    
### Deploy the container to Kubernetes(Minikube)

####Read and Follow
   https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/#create-a-docker-container-image
    
    After installing Minikube follow these steps for deploying docker conatiner to kubernetes
    
    1. minikube start
       kubectl get pods --all-namespaces
       minikube dashboard 
    
    2. Instead of pushing your Docker image to a registry, you can simply build the image using the same Docker host as the Minikube VM, so that the images are automatically present. To do so, make sure you are using the Minikube Docker daemon:
       eval $(minikube docker-env)
    
    3. Build your Docker image, using the Minikube Docker daemon
       docker build -t docker-tomcat:v2 .
    
    4. Use the kubectl run command to create a Deployment that manages a Pod. The Pod runs a Container based on your docker-tomcat:v2 Docker image:
       kubectl run docker-tomcat --image=docker-tomcat:v2 --port=8080
       kubectl get pods  // Check the pods
       kubectl get events

    5. From your development machine, you can expose the Pod to the public internet using the kubectl expose command:
       kubectl expose deployment docker-tomcat --type=LoadBalancer
       kubectl get services // to view service 
    
    6. On Minikube, the LoadBalancer type makes the Service accessible through the minikube service command.
       minikube service docker-tomcat // view the output

    7. To kill uninteruptedly, Login to minikube
       minikube ssh
       
       Execute this script, killing the container every minute
       
       $ #!/bin/sh
       $ a=0
       $ 
       $ while [ $a -lt 10 ]
       > do
       > echo $a
       > a=`expr $a + 1`
       > echo "killing node server/container every minute"
       > ps -ef | grep "tomcat" | cut -d ' ' -f6 | xargs sudo kill -9
       > sleep 1m
       > done


    
    Go to minikube dashboard to see the changes

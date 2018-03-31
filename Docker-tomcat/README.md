### Basic Building Docker Commands 
	#  . indicates current folder, you should run only where docker file is present
	docker build -t docker-tomcat:1.0 .  # equivalent of compiling
	docker images
	
### Basic Running Commands	
	docker run -d -p 8080:8080 -p 8100:8100 docker-tomcat:1.0  # running the code
	docker exec -it a6d4370aa0a4 /bin/bash
	docker ps
	docker ps
	docker kill <containerid>
	
	
	To go inside the container and check the html file
	docker exec -it 5dabed814270 /bin/bash
# READ
        https://docker-curriculum.com/	
        
        


# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)

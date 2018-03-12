### Basic Building Docker Commands 
	docker build -t docker-tomcat:1.0 .  # equivalent of compiling
	docker images
	
### Basic Running Commands	
	docker run -d -p 8080:8080 -p 8009:8009 docker-tomcat:1.0  # running the code
	docker exec -it a6d4370aa0a4 /bin/bash
	docker ps
	docker ps
	docker kill <containerid>
	
	
	To go inside the container and check the html file
	docker exec -it 5dabed814270 /bin/bash
	
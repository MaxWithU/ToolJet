build:
	docker build -t tj .
	docker run -i -t -p 8001:80 -p 3000:3000 tj
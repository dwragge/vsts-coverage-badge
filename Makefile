build:
	dep ensure
	GOOS=linux go build -ldflags="-s -w" -o bin/main main.go
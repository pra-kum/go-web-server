# The Go webserver application compiles with Go version 1.12+

# Fetch the latest official Golang alpine image from Docker Hub.
FROM golang:alpine

# Metadata annotations to support OCI Image Format Specification.
LABEL	org.opencontainers.image.created "2019-07-18T12:19:46-0400" \
	org.opencontainers.image.authors "Praveen Kumar <prv.k@outlook.com>" \
	org.opencontainers.image.source "https://github.com/pra-kum/go-web-server" \
	org.opencontainers.image.documentation "https://github.com/pra-kum/go-web-server" \
	org.opencontainers.image.version "1.0" \
	org.opencontainers.image.vendor "Fullscript" \
	org.opencontainers.image.title "go-web-server" \
	org.opencontainers.image.description "This Dockerfile compiles and then runs \
					the web server from above mentioned repository."

# Switch to a target directory inside the container.
# The directory is created if it does not already exists.
WORKDIR /app

# Copy the source application file from local computer \
# to the present directory (working directory) inside the container.
COPY main.go .

# Compile the application.
RUN go build main.go

# Expose the port on which the application runs by default.
EXPOSE 8080

# Run the compiled application when the container is run.
ENTRYPOINT ["./main"]

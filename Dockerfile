FROM golang:1.22.3-alpine3.18 as baseimage

# Set the Current Working Directory inside the container
WORKDIR /app  
# copy files in the current directory to the working directory
COPY . .
#copmiling the go code to static binary
RUN go build -o main .

FROM scratch

WORKDIR /root/

COPY --from=baseimage /app/main .

# Command to run the executable
CMD ["./main"]

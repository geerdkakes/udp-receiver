# Test UDP and TCP connections

## on receving side run
Edit file to set correct port number
```
node receive-udp.js
```

```
node receive-http.js
```

## on sending site run

for tcp connection
```
while echo $counter; do counter=$((counter+1)); echo -n "$counter" | curl -m 2 10.38.253.2:5000;sleep 5; done
```

for udp connection
```
while echo $counter; do counter=$((counter+1)); echo -n "$counter" | nc -v -n -u -w1 10.38.253.2 5005; sleep 5;done
```

## Testing from a pod on kubernetes

To use these tools from within a pod first run the following command:
```
kubectl run netcat -it --image=geerd/netcat --restart=Never -- /bin/bash
```

## Building the containers

There are two containers, one for receiving and one for sending. Both containers can be build using the build script:

```
./build.sh <version> <repo>
```
Where 
- repo: dockerhub | eccd
- version: is the version of the current build



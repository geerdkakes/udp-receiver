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





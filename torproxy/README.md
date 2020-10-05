# quick isolated tor proxy

# Usage
1. run the container
```
docker run -d -p 127.0.0.1:9050:9050 --name torproxy wfnintr/torproxy
```

2. use `torsocks` on your local machine to check tor is working
```
torsocks --isolate curl https://check.torproject.org/api/ip
```


# Note: up to five streams included:
```
docker run -d \
	-p 127.0.0.1:9050:9050 \ 
	-p 127.0.0.1:9051:9051 \
	-p 127.0.0.1:9052:9052 \
	-p 127.0.0.1:9053:9053 \
	-p 127.0.0.1:9054:9054 \
	--name torproxy wfnintr/torproxy
```

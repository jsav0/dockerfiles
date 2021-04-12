## Gophernicus - 6MB Alpine Image

### Build 
```
docker build . -t gophernicus
```

### Run: Basic usage
```
docker run --hostname example.com -p 70:70 -v $HOME/gopher/public:/var/gopher/ gophernicus
```
* `-p 70:70` forwards traffic to the docker container
* `-v $HOME/gopher/public:/var/gopher/`: supply your own data directory. container can be ephemeral. 

Optionally, supply your own xinetd.conf to override the default
* `-v gophernicus.xinetd.conf:/etc/xinetd.d/gophernicus`

## Build 
```
docker build . -t gophernicus
```

### Run: Basic usage
```
docker run --hostname example.com \
   -p 70:70 \
   -v $HOME/gopher/public:/var/gopher/ \
   -v $HOME/gopher/gophernicus.xinetd.conf:/etc/xinetd.d/gophernicus gophernicus
```

* `-v $HOME/gopher/public:/var/gopher/`: supply your data directory
* `-v $HOME/gopher/gophernicus.xinetd.conf:/etc/xinetd.d/gophernicus`: supply
  your own xinetd.conf to override the default

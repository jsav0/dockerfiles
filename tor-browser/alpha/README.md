# Usage:

## X11
```
xhost +"local:docker@"
docker run --log-driver none --rm \
	-v /dev/shm:/dev/shm \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-e DISPLAY=$DISPLAY \
	wfnintr/torbrowser
```

## Wayland
x11docker appears to work well for running X11 apps under wayland.   
```
x11docker wfnintr/torbrowser
```


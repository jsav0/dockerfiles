# Usage:
```
docker run --log-driver none --rm \
	-v /dev/shm:/dev/shm \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-e DISPLAY=$DISPLAY \
	torbrowser
```

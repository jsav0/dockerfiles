# dirsearch in a docker container
Lightweight, based on python:3-alpine

## Basic Usage
```
docker run -it --rm wfnintr/dirsearch -u target -e php,html,png,js,jpg
```

Clones the [official upstream repo](https://github.com/maurosoria/dirsearch) inside of the container.

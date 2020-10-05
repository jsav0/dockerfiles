# dirsearch in a docker container
Lightweight, based on alpine

## dirsearch source: [github.com/maurosoria](https://github.com/maurosoria/dirsearch)

## basic usage
1. __Run and print usage__
```
docker run --rm -it wfnintr/dirsearch
```
2. __Run against a target__
```
docker run -it --rm wfnintr/dirsearch -u target -e php,html,png,js,jpg
```
See below for the official [README](https://github.com/maurosoria/dirsearch/blob/master/README.md) with more examples



3. __Note:__ if you want to download, build and run the image yourself:
```
wget https://raw.githubusercontent.com/maurosoria/dirsearch/master/Dockerfile
docker build . -t dirsearch
docker run --rm -it dirsearch
```

---


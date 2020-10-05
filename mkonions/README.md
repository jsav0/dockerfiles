# mkonions: v2 and v3 onion address generator 

v2 addresses generated with [eschalot](https://github.com/ReclaimYourPrivacy/eschalot)
v3 addresses generated with [mkp224o](https://github.com/cathugger/mkp224o)

1. Example: Generate v2 address 
```
docker run -v $(pwd)/onions:/tmp/onions \
  -it wfnintr/mkonions \
    v2 -vct4 -r test
```

2. Example: Generate v3 addresses 
```
docker run -v $(pwd)/onions:/tmp/onions \
  -it wfnintr/mkonions \
    v3 test
```
`-v $(pwd)/results:/tmp/results` is used to map the results to your current working directory on the host.   

The container commands `v2` and `v3` above execute `eschalot` and `mkp224o` respectively. They will print their own usage() with `-h`.   

The string `test` is the seed required for the address generators. Up to 8chars is reasonably fast. 




## Basic usage

Scan a single host
```sh
docker run -it naabu -host hackerone.com
```

Scan a list of hosts from file
```sh
cat targets.txt | docker run -i naabu -silent
```

Pipe into other scripts
```sh
cat targets.txt | docker run -i naabu -silent | docker run -i httpx -silent

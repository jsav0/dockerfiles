# feroxbuster
A fast, simple, recursive content discovery tool written in Rust.  
source: <https://github.com/epi052/feroxbuster>  
See the [official REAMDE](https://github.com/epi052/feroxbuster/blob/master/README.md) for more information and examples.  

#### Basic usage

```
docker run --init -it wfnintr/feroxbuster -u http://example.com -x js,html
```

#### Piping from stdin and proxying all requests through socks5 proxy

```
cat targets.txt | docker run --net=host --init -i wfnintr/feroxbuster --stdin -x js,html --proxy socks5://127.0.0.1:9050
```

#### Mount a volume to pass in `ferox-config.toml`

```
docker run --init -v (pwd)/ferox-config.toml:/etc/feroxbuster/ferox-config.toml -it feroxbuster -u http://example.com
```
Note: If you are using a SELinux enforced system, you may need to pass the Z attribute to the bind mount also. i.e. `-v (pwd)/ferox-config.toml:/etc/feroxbuster/ferox-config.toml:Z`

#### Define an alias for simplicity

```
alias feroxbuster="docker run --init -v ~/.config/feroxbuster:/root/.config/feroxbuster -i feroxbuster"
```

---

### Docker build
> The following steps assume you have docker installed / setup

First, clone the repository.

```
git clone https://github.com/epi052/feroxbuster.git
cd feroxbuster
```

Next, build the image.

```
sudo docker build -t feroxbuster .
```

After that, you will be able to use `docker run` as normal.  


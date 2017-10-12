# CityofZionWallet + VNC Docker Container
City of Zion Neo Wallet running in a docker container connected to via VNC


## Running container
```
docker run -itd --name myneowallet -p 5900:5900 chuyqa/docker-cityofzionwallet-vnc

```

## Connecting to your container
1. Install vnc client (ReallVNC, TigerVNC, TightVNC or your favorite)
2. Connect to your `IP.ADDRESS:5900` or `localhost:5900` with password: neo123

---

## Building locally
This can be useful if you want your vnc server to start with a non-default password
```
docker build -t localneovnc .
docker run -itd --name myneowallet -p 5900:5900 localneovnc
```

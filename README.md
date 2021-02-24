# trojan-http

Enable HTTP proxy with the aid of privoxy to deploy through Docker.
Credit to [UP4DEV](http://www.up4dev.com/2020/03/07/http-proxy-for-trojan-by-docker/).
Alpine is used instead of Ubuntu as the case of UP4DEV to slim down the image.

## Usage

Setup the container using the code below.

```
docker run \
    --name trojan-proxy \
    --restart unless-stopped \
    -e REMOTE_ADDR="your host" \
    -e PASSWORD="your password" \
    -d \
    -p <your SOCKS5 port>:1088 \
    -p <your HTTP port>:1089 \
    trkwyk/trojan-http
```

For details please refer to [UP4DEV](http://www.up4dev.com/2020/03/07/http-proxy-for-trojan-by-docker/).

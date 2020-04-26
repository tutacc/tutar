# tutar
A stand-in of shadowsocksr-libev-client


`/etc/tutarl.json`
```json
{
    "server":"52.175.64.159",
    "server_port":"152",
    "local_port":"8443",
    "obfs":"tls",
    "obfs_host":"4de6e43233.wns.windows.com",
    "fast_open":true
}
```

```bash
docker run -d --restart=always --network=host -v /etc/tutarl.json:/etc/tutarl.json --name tutar tutacc/tutar
```

# tutar
A stand-in of shadowsocksr-libev-client


`/etc/tutarl.json`
```json
{
    "server": "0.0.0.1",
    "server_port": 8888,
    "local_address": "0.0.0.0",
    "local_port": 1981,
    "password": "mpswd",
    "timeout": 60,
    "method": "aes-256-cfb",
    "protocol": "auth_sha1_v4",
    "protocol_param": "",
    "obfs": "tls1.2_ticket_auth",
    "obfs_param": "baidu.com",
    "tcp_and_udp": true,
    "fast_open": true
}
```

```bash
docker run -d --restart=always --network=host -v /etc/tutarl.json:/etc/tutarl.json --name tutar tutacc/tutar
```

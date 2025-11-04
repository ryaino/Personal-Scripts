## Fedora
`` 
https://www.linuxtechi.com/configure-static-ip-address-on-fedora/
``

```
nmcli connection show
nmcli
```

```
sudo nmcli con modify '{{CONNECTION_NAME}}' ifname {{DEVICE}} ipv4.method manual ipv4.addresses 192.168.1.97/24 gw4 192.168.1.1
```

```
sudo nmcli con mod '{{CONNECTION_NAME}}' ipv4.dns 192.168.1.1
```

```
sudo nmcli con down '{{CONNECTION_NAME}}'
sudo nmcli con up '{{CONNECTION_NAME}}'
```

```
ip a s
```
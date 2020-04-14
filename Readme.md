# samba-server

A basic single user samba-server suitable for small scale NAS-like installations where having multi-user security is not important.

## Running Samba Server

No real tricks here, the only essential thing is setting a password in the environment vars

To do so with a docker-compose file:

```yaml
version: "2"

services:
    samba:
        image: amdavidson/samba-server 
        restart: always
        environment:
            SMBPW: "Hunter22"
        ports:
            - "139:139"
            - "445:445"
            - "138:138/udp"
            - "137:137/udp"
        volumes:
            - "/host/share/folder:/share"
```

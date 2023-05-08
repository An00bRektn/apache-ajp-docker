# apache-ajp-docker
> A Docker container to interact with open AJP ports

## What is this? 🤔
[AJP](https://cwiki.apache.org/confluence/display/TOMCAT/Connectors) is a binary protocol that is meant to optimize the HTTP protocol in situations where a webserver like Apache would need to talk to Tomcat, since Apache is much faster at serving static content than Tomcat is. However, should AJP's port be exposed, it is not hard to simply configure an Apache webserver with AJP modules to get access to the Tomcat manager.

All of the material that I've found related to this misconfiguration (e.g. HTB Academy, [HackTricks](https://book.hacktricks.xyz/network-services-pentesting/8009-pentesting-apache-jserv-protocol-ajp#ajp-proxy)) explain the exploitation by installing `apache` or `nginx` locally, which I don't particularly like. This repository "dockerizes" the whole process.

## Usage 💻
**Prereqs:** [Docker](https://www.docker.com/) 🐳

1. Change the `$TARGET` in `conf/ajp-proxy.conf` to the remote host that has the exposed port
2. Run `build-docker.sh` to automate the build process and run the container (you may need to change what port the container uses is 80/tcp is already in use)
3. Visit `http[://]127.0.0.1` to see the Tomcat Manager
4. Run `docker stop CONTAINER_ID` to stop the container safely

## Improvements 🛠️
> I don't plan on adding these because this was like a 10-15 min job, but feel free to fork or even make a pull request :)

- [ ] Automate the process of changing the `$TARGET`
- [ ] Make the container smaller, use Alpine?
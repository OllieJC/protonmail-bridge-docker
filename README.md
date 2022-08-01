# protonmail-bridge-docker
Unofficial Docker image for ProtonMail-Bridge

## Default Ports
- IMAP: 29143
- SMTP: 29025

## Initial setup

``` bash
# First run the container interactive
docker-compose run --entrypoint bash --service-ports protonmail-bridge

# Configure the bridge in the container
/usr/bin/protonmail-bridge --cli
login 
# follow instructions, then exit the CLI
exit

# still in bash in the container, start and test
/usr/bin/protonmail-bridge --noninteractive --no-window
# login to IMAP/SMTP and send test email

# exit container
exit

# Start the container as a daemon
docker-compose up -d 

# send final test email
```

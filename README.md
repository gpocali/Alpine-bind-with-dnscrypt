# Alpine-bind-with-dnscrypt
 bind and dnscrypt-proxy on Alpine Linux

## Purpose
 This docker is designed to be a light weight ISC BIND DNS implmentation with DNScrypt Proxy forwarding and validation checking for configuration and zone files.
 
## Running Requirements
 - Volume: 
  - /data
 - Ports: 
  - TCP 53
  - UDP 53

## Notes
 - If RNDC file does not exist, a new file will be generated at launch
 -- RNDC file is located at /data/rndc/rndc.conf so that it can be shared with other docker containers
 - Logging
 -- Some logs are enabled by default for the local instance and are stored locally in the /data directory
 - named.conf.zones
 -- If no zone file exists in /data, a zone file will be generated based on the contents of the zone folder but will not generate if there are errors in your zone files
 -- named.conf.zones will not be replaced if it is modified
 -- To automatically regenerate the file, delete it and restart the docker container
 
## Logging
 - To enable query logging, set the following environmental variable
 -- DNS_LOGGING=true
 - This is dynamic at runtime and will store logs to /data/log directory
 
## Disclaimer
 This docker is not designed to be an anonymous nor to be a template of security for secure systems or sensitive data.  You are responsible for your own configuration and implementation of this docker.
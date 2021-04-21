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
 - Optional Port:
  - TCP 953 - Remote Control Port (set in named.conf.control)
  
## Logging
 - Some logs are enabled by default for the local instance and are stored locally in the /data/log directory
 WARNING: Query Logging is enabled by default for confirmation of functionality.  If you do not want logging, disable this before moving to production.
 - To disable Query Logging:
  - dnscrypt-proxy.toml
   - Add # to beginning of line 439
  - named.conf.logging
   - Add # to beginning of each line for 70-76

## Notes
 - If RNDC file does not exist, a new file will be generated at launch
  - RNDC file is located at /data/rndc/rndc.conf so that it can be shared with other docker containers like ISC-DHCP
 - named.conf.zones
  - If no zone file exists in /data, a zone file will be generated based on the contents of the zone folder but will not generate if there are errors in your zone files
  - named.conf.zones will not be replaced if it is modified
  - To automatically regenerate the file, delete it and restart the docker container
  - The example zone files will be created using the network information for the default network connection
 
## Disclaimer
 This docker is not designed to be an anonymous nor to be a template of security for secure systems or sensitive data.  You are responsible for your own configuration and implementation of this docker.
 
## Development
 This is a work in progress and may contain bugs in the automatic configuration script as there are numerous hardware configurations to account for and not all can be tested.  The core applications are the vanilla repository versions and issues with those should be directed toward the respective development teams.
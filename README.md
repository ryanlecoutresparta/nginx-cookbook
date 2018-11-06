# Nginx Cookbook

### Description
Created a cookbook for Nginx and included both unit and integration tests for it. We then provisioned Nginx as a reverse proxy designed to proxy 'port 80' to the port of our app. The default port of our app is 7000, but it is configurable within the default attributes file.

### Challenges
1. Trying to include all the necessary tests for Nginx.
2. Trying to make the proxy port work without any errors; we were getting bad gateway error 502 for a while - finally managed to fix it by changing the proxy.conf and default recipe files.
3. The main error/mistake we made was using 'http://development.local' in the proxy.conf file instead of 'http://localhost'. This made it impossible to vagrant up because Nginx did not recognise development.local yet, as it had not completed the mapping of development.local to 192.168.10.100 (which is done in the Vagrantfile).

### Work Log
1. Added Nginx service and package to our cookbook.
2. Created attribute and template files so we could use a proxy port.
3. Added unit and integration tests so we could test that Nginx was running, enabled and installed, as well as testing that the proxy port was working correctly and the file was being inserted into the VM.
4. UNIT TESTS: We realised that the proxy port test was failing because it was searching for the variable 'proxy_port' inside the template file (when it wasn't actually there), so we redesigned the test to remove this dependency.
5. INTEGRATION TESTS: We realised that the integration test for the status of the 'http://localhost' was returning a 502, meaning there was a bad gateway. This means that our app was not communicating with the upstream server, Nginx. We realised that this was because we didn't actually have an app for Nginx to communicate with, so we introduced nodejs and an app folder in order to have both an app and an upstream server (Nginx) to proxy the port of the app.
6.

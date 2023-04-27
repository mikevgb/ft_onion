# ft_onion

Execute redo.sh with Docker running

The goal of this project is to create a web page and make it accessible from the Tor
network by creating a hidden service. The hidden service is a web service that
hides on the Tor network.

You must run a web server that shows a webpage on the Tor network.

• The service must have a static web page: a single index.html file. The page will
be accessible through a url of the type xxxxxxxxx.onion. The content displayed
on the page is up to you.

• Nginx will be used to configure the web server. No other server or framework is
allowed.

• Access to the static page via HTTP on port 80 must be enabled.

• Access to the server via SSH on port 4242 must be enabled.

• You should not open any ports or set any firewall rules.

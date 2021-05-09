# ACME Proxy

This simple reverse proxy does two things:

 * Respond to http requests for files in the .well-known directory

 * Respond to all other requests with 301 Moved Permanently,
   redirecting to the same URL but using https.

Leave it running.  Run certbot periodically.

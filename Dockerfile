FROM antora/antora:latest

# We content will be exposed on the standard HTTP port.
EXPOSE 80/tcp

# Install git to clone the docs repo, apache to serve up the we content and
# python to process the playbooks.
RUN apk --no-cache add \
    git \
    apache2 \
    python \
    py-yaml \
  && mkdir /run/apache2

# Add a virtual host for Apache to serve requests on port 80.
COPY res/vhost.conf /etc/apache2/conf.d/

# Add in our new entry point.
COPY src/run /usr/local/bin
ENTRYPOINT ["/usr/local/bin/run"]

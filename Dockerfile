FROM antora/antora:3.0.1

# The content will be exposed on the standard HTTP port.
EXPOSE 80/tcp

RUN npm install \
    asciidoctor-kroki

# Install git to clone the docs repo, apache to serve up the we content and
# python to process the playbooks.
RUN apk --no-cache add \
    git \
    apache2 \
    python3 \
    py3-yaml

# Add a virtual host for Apache to serve requests on port 80.
COPY res/vhost.conf /etc/apache2/conf.d/

# Add in our new entry point.
COPY src/run /usr/local/bin
ENTRYPOINT ["/usr/local/bin/run"]

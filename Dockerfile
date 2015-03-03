#
# Nginx with Confd support
#
# https://github.com/echu/nginx-confd
#

# Base image
FROM dockerfile/nginx

ADD confd-watch /usr/local/bin/confd-watch

RUN \
    curl -L https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-linux-amd64 -o /usr/local/bin/confd

RUN \
    chmod +x /usr/local/bin/confd-watch && \
    chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/conf.d && \
    mkdir -p /etc/confd/templates

# Add confd toml configuration
ADD nginx.toml /etc/confd/conf.d/nginx.toml

# Add nginx template
ADD nginx.tmpl /etc/confd/templates/nginx.tmpl

# Remove the default site
RUN rm -fv /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

CMD ["confd-watch"]

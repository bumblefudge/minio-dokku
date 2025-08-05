FROM minio/minio:latest

# Add user dokku with an individual UID
# # No longer needed in modern dokku, which already generates the user dokku
# RUN adduser -u 32769 -m -U dokku
# USER dokku

# Create data directory for the user, where we will keep the data
RUN mkdir -p /home/dokku/data

# Add custom nginx.conf template for Dokku to use
WORKDIR /app
ADD nginx.conf.sigil .

CMD ["minio", "server", "/home/dokku/data", "--console-address", ":9001"]

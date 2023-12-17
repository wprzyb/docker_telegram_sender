FROM alpine:latest

ENV APITOKEN ""
ENV CHATID ""
ENV MESSAGE ""

RUN apk update && \
    apk add --no-cache curl

# Copy the Telegram sending script into the container
COPY send.sh /

# Make the script executable
RUN chmod +x /send.sh

CMD ["./send.sh"]

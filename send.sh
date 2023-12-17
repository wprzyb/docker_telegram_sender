#!/bin/sh

# Check if APITOKEN is defined and not empty
if [ -z "${APITOKEN+x}" ]; then
    echo "Error: APITOKEN is not defined."
    exit 1
elif [ -z "$APITOKEN" ]; then
    echo "Error: APITOKEN is defined but empty."
    exit 1
fi

# Check if CHATID is defined and not empty
if [ -z "${CHATID+x}" ]; then
    echo "Error: CHATID is not defined."
    exit 1
elif [ -z "$CHATID" ]; then
    echo "Error: CHATID is defined but empty."
    exit 1
fi

# Check if MESSAGE is defined and not empty
if [ -z "${MESSAGE+x}" ]; then
    echo "Error: MESSAGE is not defined."
    exit 1
elif [ -z "$MESSAGE" ]; then
    echo "Error: MESSAGE is defined but empty."
    exit 1
fi

# Send the message
send() {
    curl -s \
        -X POST \
        "https://api.telegram.org/bot$APITOKEN/sendMessage" \
        -d text="$MESSAGE" \
        -d chat_id=$CHATID
}

send

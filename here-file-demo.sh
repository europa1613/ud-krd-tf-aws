#!/bin/bash

WELCOME="Hello world!"
cat <<EOF
${WELCOME}
This is a heredoc.
Today is $(date).
EOF

#!/usr/bin/env bash
# Print primary global IPv4, or "offline"
ip=$(ip -4 -o addr show scope global 2>/dev/null | awk '{print $4}' | cut -d/ -f1 | head -1)
echo "${ip:-offline}"

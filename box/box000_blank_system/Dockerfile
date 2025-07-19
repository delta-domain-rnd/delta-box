ARG image=ubuntu:25.04

# Use latest Ubuntu version as base
FROM $image

ARG image
RUN /bin/sh -c '\
  if echo "$image" | grep -q "^ubuntu"; then \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    echo "Asia/Kolkata" > /etc/timezone && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure -f noninteractive tzdata; \
  else \
   ( exit 0 ); \
  fi \
'

# Copy the entrypoint script
COPY boot/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
 
# Use the custom entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

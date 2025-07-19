ARG image=alpine:latest

# Use latest Ubuntu version as base
FROM $image

# Copy the entrypoint script
COPY boot/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
 
# Use the custom entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

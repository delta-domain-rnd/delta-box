#!/bin/sh

# Modify the prompt
echo "export PS1=\"deltabox000:\W\# \"" >> /etc/profile

# echo "Welcome to the dbmint terminal!" > /etc/motd
# echo >> /etc/motd
# echo 'Users are not adviced to use this.' >> /etc/motd
# echo 'dbmint is recommended to be used as an external command.' >> /etc/motd
# echo >> /etc/motd
# echo 'You may change this message by editing /etc/motd.' >> /etc/motd

# For SSH:
# ssh-keygen -A
# /usr/sbin/sshd -D &

# TODO This should reflect the is_persistent file having Yes or No.

# If Yes:
# Stay on indefinitely 
# tail -f /dev/null

# If No:
# Just run the app
# . /opt/venv/bin/activate && \
#  PYTHONPATH=/app/src python3 -m dbmint.main $@

echo "Hello World!"

# Stay on indefinitely 
tail -f /dev/null

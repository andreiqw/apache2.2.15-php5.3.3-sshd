FROM andreiqw/apache2.2.15-php5.3.3

# Install openssh, git and acl
# Allow root to login
# Make php available in ssh sessions
RUN apk add --no-cache openssh acl git && \
        echo 'PermitRootLogin yes' | tee -a /etc/ssh/sshd_config && \
        ln -s /usr/local/bin/php /usr/bin/php

ADD sshd-entrypoint /usr/local/bin/

CMD ["sshd-entrypoint"]

EXPOSE 22

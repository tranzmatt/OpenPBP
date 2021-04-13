FROM ruby:2.4

RUN apt-get update && apt install -y git build-essential libssl-dev libreadline-dev expect \
    zlib1g-dev mariadb-server libmariadb-dev-compat libmariadbclient-dev liblzma-dev patch

RUN git clone https://github.com/tranzmatt/OpenPBP.git /src/OpenPBP

WORKDIR /src/OpenPBP/OpenPBP

RUN bundle install

ARG MYSQL_ROOT_PASSWORD=abcd1234

COPY mysql_secure.sh /tmp
COPY setup.sql /tmp

RUN bash -c '/etc/init.d/mysql start' \
    && bash -c '/etc/init.d/mysql status' \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} < /tmp/setup.sql \
    && rake db:migrate

COPY start.sh /

CMD ["bash", "/start.sh"]

#padrino s -h 0.0.0.0

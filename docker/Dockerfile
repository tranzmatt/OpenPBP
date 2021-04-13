#FROM ruby:2.7.3
FROM ruby:2.4
#FROM ruby:latest

#RUN apt-get update && apt-get -y upgrade

RUN apt-get update && apt install -y git build-essential libssl-dev libreadline-dev expect \
    zlib1g-dev mariadb-server libmariadb-dev-compat libmariadbclient-dev liblzma-dev patch


#RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
##### Export rbenv to .bashrc
#RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
#RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
#### Refresh Your Environment
#### Install ruby-build for rbenv
#RUN . ~/.bashrc \
#    && mkdir -p "$(rbenv root)"/plugins \
#    && git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build 
#    && rbenv install 2.4.2 
#    && rbenv global 2.4.2

WORKDIR /src

RUN git clone https://github.com/mjolnirdev/OpenPBP.git

WORKDIR /src/OpenPBP/OpenPBP

RUN bundle install

ARG MYSQL_ROOT_PASSWORD=abcd1234

COPY mysql_secure.sh /tmp
COPY setup.sql /tmp

RUN bash -c '/etc/init.d/mysql start' \
    && bash -c '/etc/init.d/mysql status' \
    && bash -c '/tmp/mysql_secure.sh $MYSQL_ROOT_PASSWORD' \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} < /tmp/setup.sql \
    && rake db:migrate

#padrino s -h 0.0.0.0

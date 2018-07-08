FROM debian:9
#RUN apt-get update && apt-get -y install netcat curl
RUN  apt-get update && apt-get -y install \
   wget netcat \
   apt-transport-https ca-certificates \
   gnupg2 curl \
   git wget sudo netcat vim less net-tools \
   pwgen

#RUN wget https://software.open-xchange.com/oxbuildkey.pub -O - | apt-key add -
RUN curl https://software.open-xchange.com/oxbuildkey.pub | apt-key add -
ADD open-xchange.list /etc/apt/sources.list.d/

RUN apt-get update && apt-get -y install open-xchange open-xchange-authentication-database open-xchange-grizzly \
  open-xchange-admin open-xchange-appsuite \
  open-xchange-appsuite-backend open-xchange-appsuite-manifest \
   \
  open-xchange-appsuite \
  open-xchange-appsuite-l10n-de-de \
  apache2 && \
  apt-get clean 

ADD jessy-backports.list /etc/apt/sources.list.d/
RUN apt-get update && \
  apt-get -y install python-certbot-apache -t jessie-backports && \
  apt-get clean


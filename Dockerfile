FROM debian:buster-slim 

RUN apt-get update \
&&  apt-get install -y samba

ARG USER=share
ARG SMBPW=do_not_use_insecure

RUN groupadd -g 5858 "$USER" \
&&  useradd -u 5858 -g 5858 "$USER" \
&&  (echo "$SMBPW";echo "$SMBPW") | smbpasswd -sa "$USER"

EXPOSE 137/udp 138/udp 139 445

RUN mkdir /share && chown share:share /share && chmod 0777 /share

VOLUME /share

COPY ./etc /etc

COPY run.sh ./

CMD ./run.sh



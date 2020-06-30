FROM alpine

RUN apk update && \
    apk add clamav-daemon clamav-libunrar unrar

RUN mkdir /run/clamav && chown clamav:clamav /run/clamav
RUN sed -i 's/#TCPSocket/TCPSocket/' /etc/clamav/clamd.conf
RUN sed -i 's/#StreamMaxLength 10M/StreamMaxLength 50M/' /etc/clamav/clamd.conf

RUN freshclam

EXPOSE 3310

ENTRYPOINT [ "clamd", "-F" ]

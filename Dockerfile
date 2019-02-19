FROM python:3-alpine
ARG BASIC_AUTH="user:pass" 
ENV BASIC_AUTH=${BASIC_AUTH}

COPY proxy.py /app/
EXPOSE 8899/tcp

WORKDIR /app
ENTRYPOINT [ "./proxy.py" ]
CMD [ "--host=0.0.0.0", \
      "--port=8899", \
      "--backlog=100", \
      "--basic-auth=${BASIC_AUTH}," \
      "--server-recvbuf-size=16384", \
      "--client-recvbuf-size=16384", \
      "--open-file-limit=1024", \
      "--log-level=ERROR" ]

FROM mcr.microsoft.com/powershell

WORKDIR /app
COPY ./ ./

RUN ln -s /app/trx2junit.sh /usr/bin/trx2junit

CMD [ "trx2junit" ]

FROM swipl

WORKDIR /app

ADD /src /app/src
ADD /main.pl /app/main.pl 

CMD ["swipl", "/app/main.pl"]
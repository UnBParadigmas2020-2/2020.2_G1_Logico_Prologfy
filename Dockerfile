FROM swipl

COPY . /app

CMD ["swipl", "/app/prologfy.pl"]
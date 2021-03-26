FROM swipl

COPY . ./

CMD ["swipl", "/main.pl"]
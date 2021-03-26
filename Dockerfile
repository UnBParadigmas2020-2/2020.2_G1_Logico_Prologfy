FROM swipl

COPY . ./

CMD ["swipl", "/src/prologfy.pl"]
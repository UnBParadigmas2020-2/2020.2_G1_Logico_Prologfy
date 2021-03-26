% Insere os dados em uma tabela
insertInto(Table, Args, Data) :- Data =.. [Table|Args], assertz(Data).

% Remove os dados em uma tabela
removeFrom(Table, Args, Data) :- Data =.. [Table|Args], retract(Data).


insertInto(Table, Args, Data) :- Data =.. [Table|Args], assertz(Data). %Insere os dados em uma tabela.



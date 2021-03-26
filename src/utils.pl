read_atom(Result) :- 
    read_string(user, "\n", "\r", _, Value),
    string_to_atom(Value, Result).

read_atom_with_message(Message, Result) :- 
    format('~w : ',[Message]),
    read_string(user, "\n", "\r", _, Value),
    string_to_atom(Value, Result).

read_atom_list(Message, Separator, Result):-
    format('~w ? ',[Message]),
    read_string(user, "\n", "\r", _, Value),
    re_replace('\s', '', Value, V),
    string_to_atom(V, G),
    atomic_list_concat(Result, Separator, G).

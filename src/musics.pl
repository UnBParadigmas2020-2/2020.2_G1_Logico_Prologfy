:- [api].
:- [utils].

:- dynamic music/3.


addMusic:-
    read_atom_with_message('Nome', MusicName),
    read_atom_with_message('Genero', Generos),
    read_atom_with_message('Album', AlbumName),
    write('\e[H\e[2J'),
    insertInto('music', [MusicName,Generos,AlbumName], _),
    write('Musica inserida com sucesso.').

removeMusic:-
    read_atom_with_message('Nome', MusicName),
    write('\e[H\e[2J'),
    (removeFrom('music', [MusicName, _, _], _)
     -> write('Musica "'), write(MusicName), write_ln('" removida com sucesso.'), menu
     ;  write('A musica "'), write(MusicName), write_ln('" não esta cadastrada.'), menu).

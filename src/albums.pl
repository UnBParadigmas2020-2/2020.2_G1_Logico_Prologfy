:- [api].
:- [utils].

:- dynamic album/3.

addAlbum:-
    read_atom_with_message('Nome', AlbumName),
    read_atom_with_message('Autor', ArtistName),
    read_atom_with_message('Ano', Year),
    insertInto('album', [AlbumName,ArtistName,Year], _).

removeAlbum:-
    read_atom_with_message('Nome', AlbumName),
    write('\e[H\e[2J'),
    (removeFrom('album', [AlbumName, _, _], _)
      -> write('O Album "'), write(AlbumName), write_ln('" foi removido com sucesso.'), menu
      ;  write('O Album "'), write(AlbumName), write_ln('" não esta cadastrado.'), menu).

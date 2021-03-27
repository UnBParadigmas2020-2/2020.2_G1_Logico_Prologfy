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
    removeFrom('album', [AlbumName, _, _], _).

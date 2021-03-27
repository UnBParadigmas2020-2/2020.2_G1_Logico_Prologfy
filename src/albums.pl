:- [api].
:- [utils].

:- dynamic album/3.

album(damn, 'kendrick lamar', '2017').
album('nome generico', 'ariana', '2017').
album(blonde, 'frank ocean', '2017').
album('The Life of Pablo', 'kanye west', '2016').
album('Uma Nova História', 'wesley safadao', '2012').
album('Paradise', 'wesley safadao', '2014').

addAlbum:-
    read_atom_with_message('Nome', AlbumName),
    read_atom_with_message('Autor', ArtistName),
    read_atom_with_message('Ano', Year),
    insertInto('album', [AlbumName,ArtistName,Year], _).

removeAlbum:-
    read_atom_with_message('Nome', AlbumName),
    removeFrom('album', [AlbumName, _, _], _).

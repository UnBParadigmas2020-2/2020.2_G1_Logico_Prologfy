:- [api].
:- [utils].

:- dynamic album/3.

album('Damn', 'kendrick lamar', '2017').
album('Blonde', 'frank ocean', '2017').
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
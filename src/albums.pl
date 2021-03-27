:- [api].
:- [utils].

:- dynamic album/3.

album('Damn', 'Kendrick Lamar', '2017').
album('Lemonade', 'Beyoncé', '2016').
album('Blonde', 'Frank Ocean', '2016').
album('Ctrl', 'SZA', '2017').
album('The Life of Pablo', 'Kanye West', '2016').
album('Uma Nova História', 'wesley safadao', '2012').
album('Paradise', 'Wesley Safadao', '2014').

addAlbum:-
    read_atom_with_message('Nome', AlbumName),
    read_atom_with_message('Autor', ArtistName),
    read_atom_with_message('Ano', Year),
    insertInto('album', [AlbumName,ArtistName,Year], _).

removeAlbum:-
    read_atom_with_message('Nome', AlbumName),
    removeFrom('album', [AlbumName, _, _], _).

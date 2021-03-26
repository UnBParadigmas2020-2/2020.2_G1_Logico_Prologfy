:- [api].
:- [utils].

:- dynamic music/3.

% nome, gênero, ano, álbum, 
music('Não pare', [forro, romantico], 'Uma Nova História').
music('Disco voador', [forro, romantico], 'Uma Nova História').
music('Caranguejo', [forro, romantico], 'Uma Nova História').
music('Ei olha o som', [forro, romantico], 'Uma Nova História').
music('Vai esperar', [forro, romantico], 'Uma Nova História').
music('Monotonia', [forro, romantico], 'Paradise').
music('Poderosa', [forro, romantico], 'Paradise').

addMusic:-
    read_atom_with_message('Nome', MusicName),
    read_atom_list('Genero(s) (separados por vírgula caso > 1)', ',', Generos),
    read_atom_with_message('Album', AlbumName),
    insertInto('music', [MusicName,Generos,AlbumName], _).

removeMusic:-
    read_atom_with_message('Nome', MusicName),
    removeFrom('music', [MusicName, _, _], _).
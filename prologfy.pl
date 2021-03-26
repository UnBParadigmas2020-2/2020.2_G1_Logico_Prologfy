:- [artists].
:- [albums].
:- [musics].
:- [api].

musicasGenero(GeneroToFind):-
	findall(Musica, (musics(Musica, Genero, _, _), percorreLista(GeneroToFind, Genero))
		,MusicList),
	write('O genero '), 
	write(GeneroToFind), 
	(length(MusicList, 0) 
	-> write(' não possui músicas cadastradas.')
	;  write(' tem as musicas '), write(MusicList)).

musicasArtista(Artista):-
	findall(Musica,musics(Musica, Artista, _, _),Lista),
	write('O genero '), 
	write(Artista), 
	write(' tem as musicas '),
	write(Lista).

artistasGenero(Especifico):- 
	findall(Artista,
		(artista(Artista, Generos, _),percorreLista(Especifico, Generos))
		,Lista),
	write('Artista '), 
	write(Lista), 
	write(' tem musicas do genero '),
	write(Especifico).


percorreLista(Especifico, H):- Especifico == H.
percorreLista(Especifico, [H|_]):- Especifico == H.
percorreLista(Especifico, [_|T]):- percorreLista(Especifico, T).


:- [artists].
:- [albums].
:- [musics].
:- [api].

musicasGenero(Genero):-
	findall(Musica,musica(Musica, _, Genero),Lista),
	write('O genero '), 
	write(Genero), 
	write(' tem as musicas '),
	write(Lista).

musicasArtista(Artista):-
	findall(Musica,musica(Musica, Artista, _),Lista),
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


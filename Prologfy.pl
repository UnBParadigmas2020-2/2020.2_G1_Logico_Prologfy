:- dynamic artista/3.

artista(ariana, [dance, romantico], solo).
artista(ivete, [axe, romantico], solo).
artista(drake, [rap, hip-hop], solo).
artista('wesley safadao', [forro, romantico], solo).


:- dynamic musica/3.

musica(musica1, ariana, dance).
musica(musica2, ariana, romantico).
musica(musica3, ivete, axe).
musica(musica4, drake, hip-hop).
musica(musica5, ivete, dance).
musica(musica6, ivete, romantico).
musica(musica7, 'wesley safadao', forro).
musica(musica8, ivete, dance).
musica(musica9, 'wesley safadao', forro).
musica(musica10, ariana, romantico).
musica(musica11, drake, hip-hop).
musica(musica12, ariana, dance).
musica(musica13, drake, rap).
musica(musica14, ivete, axe).
musica(musica15, ivete, dance).
musica(musica16, drake, rap).


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

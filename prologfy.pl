:- [artists].
:- [albums].
:- [musics].
:- [api].

musicasGenero(GeneroToFind):-
	findall(Musica, (music(Musica, Genero, _), percorreLista(GeneroToFind, Genero))
		,MusicList),
	write('O genero '), 
	write(GeneroToFind), 
	(length(MusicList, 0) 
		-> write(' não possui músicas cadastradas.')
		;  write(' tem as musicas '), write(MusicList)
	).

musicasArtista(Artista):-
	findall(Album, album(Album, Artista, _), AlbumList),
	(length(AlbumList, 0)
		-> write('Não possui álbuns cadastrados'), fail
		; albunsArtista(AlbumList)
	).

albunsArtista([]). 
albunsArtista([H|T]):- 
	findall(Musica, music(Musica, _, H), MusicList),
	printList(MusicList),
	albunsArtista(T).
albunsArtista(_):- fail .

musicasAno(Ano):-
	findall(Album, album(Album, _, Ano), AlbumList),
	albunsArtista(AlbumList).

musicasAlbum(Album):-
	findall(Musica, music(Musica, _, Album), MusicList),
	write('O Album '), 
	write(Album), 
	(length(MusicList, 0) 
		-> write(' não possui músicas cadastradas.')
		;  write(' tem as musicas '), write(MusicList)
	).

artistasGenero(Especifico):- 
	findall(Artista,
		(artista(Artista, Generos, _),percorreLista(Especifico, Generos))
		,Lista),
	write('Artista '), 
	write(Lista), 
	write(' tem musicas do genero '),
	write(Especifico).

printList([]).	
printList([H|T]):- write(H), write(, ), printList(T).

percorreLista(Especifico, H):- Especifico == H.
percorreLista(Especifico, [H|_]):- Especifico == H.
percorreLista(Especifico, [_|T]):- percorreLista(Especifico, T).


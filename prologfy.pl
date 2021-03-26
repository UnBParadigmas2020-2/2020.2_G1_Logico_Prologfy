:- [artists].
:- [albums].
:- [musics].
:- [api].

musicasGenero(GeneroToFind):-
	findall(Musica, (music(Musica, Genero, _, _), percorreLista(GeneroToFind, Genero))
		,MusicList),
	write('O genero '), 
	write(GeneroToFind), 
	(length(MusicList, 0) 
	-> write(' não possui músicas cadastradas.')
	;  write(' tem as musicas '), write(MusicList)).


%musicasArtista(Artista):-
%	findall(Musica, 
%	music(Musica, _, _, percorreLista(findall(Album, album(Album, Artista, _), _)_)5
%	),
%	ListaMusica),
%	write('O genero '), 
%	write(Artista), 
%	write(' tem as musicas '),
%	write(ListaMusica).
	
musicasAlbum(Album):-
	findall(Musica, music(Musica, _, _, Album), MusicList),
	write('O Album '), 
	write(Album), 
	(length(MusicList, 0) 
	-> write(' não possui músicas cadastradas.')
	;  write(' tem as musicas '), write(MusicList)).
	
musicasAlbumT([]).	
musicasAlbumT([H|T]):- write(H), write(, ), musicasAlbumT(T).

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


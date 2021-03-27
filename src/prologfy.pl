:- [albums].
:- [musics].
:- [api].

albunsArtista:-
	read_atom_with_message('Insira o nome do artista', AlbumArtista),
	write('\e[H\e[2J'),
	findall(Album, (album(Album, Artista, _), percorreLista(AlbumArtista, Artista))
		,AlbumList),
	write('O artista "'), 
	write(AlbumArtista), 
	(length(AlbumList, 0) 
		-> write_ln('" não possui álbuns cadastrados.')
		;  write('" tem os álbuns '), write_ln(AlbumList)
	).

albunsGenero:-
	read_atom_with_message('Insira o nome do gênero', GeneroToFind),
	write('\e[H\e[2J'),
	findall(Album, (music(_, Genero, Album), percorreLista(GeneroToFind, Genero))
		,AlbumList),
	sort(AlbumList, AlbumListSort),
	write('O genero '), 
	write(GeneroToFind), 
	(length(AlbumListSort, 0) 
		-> write(' não possui álbuns cadastrados.')
		;  write(' tem os álbuns '), write_ln(AlbumListSort)
	).

musicasGenero:-
	read_atom_with_message('Insira o nome do gênero', GeneroToFind),
	write('\e[H\e[2J'),
	findall(Musica, (music(Musica, Genero, _), percorreLista(GeneroToFind, Genero))
		,MusicList),
	write('O genero "'), 
	write(GeneroToFind), 
	(length(MusicList, 0) 
		-> write_ln('" não possui músicas cadastradas.')
		;  write('" tem as musicas '), write_ln(MusicList)
	).

musicasArtista:-
	read_atom_with_message('Insira o nome do artista', Artista),
	write('\e[H\e[2J'),
	findall(Album, album(Album, Artista, _), AlbumList),
	(length(AlbumList, 0)
		-> write('O artista "'),
		   write(Artista),
		   write_ln('" não possui álbuns cadastrados'),
		   main
		; write('O artista "'),
		  write(Artista),
		  write_ln('" possui as musicas:'),
		  albunsArtista(AlbumList)
	).

albunsArtista([]). 
albunsArtista([H|T]):- 
	findall(Musica, music(Musica, _, H), MusicList),
	printList(MusicList),
	write_ln(''),
	albunsArtista(T).
albunsArtista(_):- fail .

musicasAno:-
	read_atom_with_message('Insira o ano', Ano),
	write('\e[H\e[2J'),
	findall(Album, album(Album, _, Ano), AlbumList),
	write('O Ano "'), 
	write(Ano),
	(length(AlbumList, 0)
		-> write_ln('" não possui musicas cadastradas.'),
		   main
		; write('" teve o(s) album(s) '),
		  write(AlbumList),
		  write(' que'),
		  albunsArtista(AlbumList)
	).


musicasAlbum:-
	read_atom_with_message('Insira o nome do álbum', Album),
	write('\e[H\e[2J'),
	findall(Musica, music(Musica, _, Album), MusicList),
	write('O Album "'), 
	write(Album), 
	(length(MusicList, 0) 
		-> write_ln('" não possui músicas cadastradas.')
		;  write('" tem as musicas '), 
		   write_ln(MusicList)
	).

%artistasGenero:- 
%	read_atom_with_message('Insira o nome do gênero', Especifico),
%	findall(Artista,
%		(artista(Artista, Generos, _),percorreLista(Especifico, Generos))
%		,Lista),
%	write('Artista '), 
%	write(Lista), 
%	write(' tem musicas do genero '),
%	write(Especifico).

printList([]).	
printList([H|T]):- write(H), write_ln(','), printList(T).

percorreLista(Especifico, H):- Especifico == H.
percorreLista(Especifico, [H|_]):- Especifico == H.
percorreLista(Especifico, [_|T]):- percorreLista(Especifico, T).


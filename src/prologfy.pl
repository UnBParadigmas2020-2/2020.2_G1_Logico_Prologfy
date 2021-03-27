:- [albums].
:- [musics].
:- [api].

albunsArtista:-
	read_atom_with_message('Insira o nome do artista', AlbumArtista),
	write('\e[H\e[2J'),
	findall(Album, album(Album, AlbumArtista, _)
		,AlbumList),
	write('O artista "'), 
	write(AlbumArtista), 
	(length(AlbumList, 0) 
		-> write_ln('" não possui álbuns cadastrados.')
		;  write_ln('" tem os álbuns:'),
		   printList(AlbumList)
	).

albunsGenero:-
	read_atom_with_message('Insira o nome do gênero', GeneroToFind),
	write('\e[H\e[2J'),
	findall(Album, music(_, GeneroToFind, Album)
		,AlbumList),
	sort(AlbumList, AlbumListSort),
	write('O genero "'), 
	write(GeneroToFind), 
	(length(AlbumListSort, 0) 
		-> write('" não possui álbuns cadastrados.')
		;  write_ln('" tem os álbuns: '),
		   printList(AlbumListSort)
	).

albunsPorAno:-
	read_atom_with_message('Insira o ano de lançamento', YearToFind),
	findall((Name), album(Name, _, YearToFind), AlbumList),
	write('O ano de lançamento '),
	write(YearToFind),
	(length(AlbumList, 0) 
		-> write(' não possui álbuns cadastrados.')
		;  write(' contém os álbuns: '), write_ln(AlbumList)
	).

musicasGenero:-
	read_atom_with_message('Insira o nome do gênero', GeneroToFind),
	write('\e[H\e[2J'),
	findall(Musica, music(Musica, GeneroToFind, _) ,MusicList),
	write('O genero "'), 
	write(GeneroToFind), 
	(length(MusicList, 0) 
		-> write_ln('" não possui músicas cadastradas.')
		;  write_ln('" tem as musicas:'), 
		   printList(MusicList)
	).

musicasArtista:-
	read_atom_with_message('Insira o nome do artista', Artista),
	write('\e[H\e[2J'),
	findall(Album, album(Album, Artista, _), AlbumList),
	(length(AlbumList, 0)
		-> write('O artista "'),
		   write(Artista),
		   write_ln('" não esta cadastrado(a).'),
		   menu
		; write('O artista "'),
		  write(Artista),
		  write_ln('" possui o(s) album(s):'),
		  albunsArtista(AlbumList)
	).

albunsArtista([]). 
albunsArtista([H|T]):- 
	write('"'),
	write(H),
	findall(Musica, music(Musica, _, H), MusicList),
	(length(MusicList, 0)
		-> write_ln('" que não possui musicas cadastradas.'),
		   menu
		; write_ln('" contem as musicas:'),
		printList(MusicList)),
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
		   menu
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
		-> write_ln('" não tem musicas cadastradas.')
		;  write_ln('" tem as musicas:'), 
%		   write_ln(MusicList)
		   printList(MusicList)
	).


printList([]).	
printList([H|T]):- write('\t'), write(H), write_ln(';'), printList(T).

percorreLista(Especifico, H):- Especifico == H.
percorreLista(Especifico, [H|_]):- Especifico == H.
percorreLista(Especifico, [_|T]):- percorreLista(Especifico, T).


:- [albums].
:- [musics].
:- [api].

musicasGenero:-
	read_atom_with_message('Insira o nome do gênero', GeneroToFind),
	write('\e[H\e[2J'),
	findall(Musica, (music(Musica, Genero, _), percorreLista(GeneroToFind, Genero))
		,MusicList),
	write('O genero "'), 
	write(GeneroToFind), 
	(length(MusicList, 0) 
		-> write_ln('" não possui músicas cadastradas.'),
		   write_ln("\n\n")
		;  write('" tem as musicas '),
		   write_ln(MusicList),
		   write_ln("\n\n")
	).

musicasArtista:-
	read_atom_with_message('Insira o nome do artista', Artista),
	write('\e[H\e[2J'),
	findall(Album, album(Album, Artista, _), AlbumList),
	(length(AlbumList, 0)
		-> write('O artista "'),
		   write(Artista),
		   write_ln('" não possui álbuns cadastrados'),
		   write_ln("\n\n"),
		   main
		; albunsArtista(AlbumList)
	).

albunsArtista([]).
albunsArtista([H|T]):-
	findall(Musica, music(Musica, _, H), MusicList),
	write(' possui as musicas: '),
	printList(MusicList),
	write_ln(''),
	albunsArtista(T).
albunsArtista(_):- fail.

musicasAno:-
	read_atom_with_message('Insira o ano', Ano),
	write('\e[H\e[2J'),
	findall(Album, album(Album, _, Ano), AlbumList),
	write('O Ano "'), 
	write(Ano),
	(length(AlbumList, 0)
		-> write_ln('" não possui musicas cadastradas.'),
		   write_ln("\n\n"),
		   main
		; write('" teve o(s) album(s) '),
		  write(AlbumList),
		  write(' que'),
		  albunsArtista(AlbumList),
		   write_ln("\n\n")
	).

musicasAlbum:-
	read_atom_with_message('Insira o nome do álbum', Album),
	write('\e[H\e[2J'),
	findall(Musica, music(Musica, _, Album), MusicList),
	write('O Album "'), 
	write(Album), 
	(length(MusicList, 0) 
		-> write_ln('" não possui músicas cadastradas.'),
		   write_ln("\n\n")
		;  write('" tem as musicas '), 
		   write_ln(MusicList),
		   write_ln("\n\n")
	).

%artistasGenero:- 
%	read_atom_with_message('Insira o nome do gênero', Especifico),
%	findall(Artista,
%		(artista(Artista, Generos, _),percorreLista(Especifico, Generos))
%		,Lista),
%	write('Artista "'), 
%	write(Lista), 
%	write('" tem musicas do genero '),
%	write(Especifico).

printList([]).	
printList([H|T]):- write(H), write_ln(','), printList(T).


percorreLista(Especifico, H):- Especifico == H.
percorreLista(Especifico, [H|_]):- Especifico == H.
percorreLista(Especifico, [_|T]):- percorreLista(Especifico, T).


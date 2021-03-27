:- ['src/albums'].
:- ['src/musics'].
:- ['src/prologfy'].
:- ['src/api'].


switch(_, [], ReturnTo) :- write_ln('Opção inválida'), call(ReturnTo).
switch(X, [Val:Goal|Cases], ReturnTo) :-
    ( X==Val ->
        call(Goal),
        call(ReturnTo)
    ;
        switch(X, Cases, ReturnTo)
    ).

handle_album:-
    write('\e[H\e[2J'),
    write_ln('====================== Prologfy ======================'),
    write_ln('[1] - Inserir álbum'),
    write_ln('[2] - Remover álbum'),
    write_ln('[3] - Voltar para menu inicial'),
    write_ln('====================== Prologfy ======================'),
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : addAlbum(),
            "2" : removeAlbum(),
            "3" : write('\e[H\e[2J'), menu
        ],
        menu
    ).

handle_music:-
    write('\e[H\e[2J'),
    write_ln('====================== Prologfy ======================'),
    write_ln('[1] - Inserir música'),
    write_ln('[2] - Remover música'),
    write_ln('[3] - Voltar para menu inicial'),
    write_ln('====================== Prologfy ======================'),
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : addMusic(),
            "2" : removeMusic(),
            "3" : write('\e[H\e[2J'), menu
        ],
        menu
    ).

handle_search:-
    write('\e[H\e[2J'),
    write_ln('====================== Prologfy ======================'),
    write_ln('[1] - Buscar músicas de um artista'),
    write_ln('[2] - Buscar músicas de um álbum'),
    write_ln('[3] - Buscar músicas de um ano'),
    write_ln('[4] - Buscar músicas por gênero'),
    write_ln('[5] - Buscar álbuns por artista'),
    write_ln('[6] - Buscar álbuns por gênero'),
    write_ln('[7] - Voltar para menu inicial'),
    write_ln('====================== Prologfy ======================'),
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : musicasArtista(),
            "2" : musicasAlbum(),
            "3" : musicasAno(),
            "4" : musicasGenero(),
            "5" : albunsArtista(),
            "6" : albunsGenero(),
            "7" : write('\e[H\e[2J'), menu
        ],
        menu
    ).

exit:-
    delete_file('db/albuns.csv'),
    delete_file('db/musics.csv'),
    findall(row(Music, Gen, Ano), music(Music,Gen, Ano) ,MusicList), 
        csv_write_file('db/musics.csv', MusicList),
    findall(row(Nome, Art, Ano), album(Nome, Art, Ano) ,AlbumList), 
        csv_write_file('db/albuns.csv', AlbumList),
    write_ln('Até mais!!'),
    halt(0).

main:-
    csv_read_file('db/musics.csv', RowsMusic, [functor(music), arity(3)]),
        maplist(assert, RowsMusic),
    csv_read_file('db/albuns.csv', RowsAlbuns, [functor(album), arity(3)]),
        maplist(assert, RowsAlbuns),
    menu().

menu:-
    write_ln("\n\n"),
    write_ln('====================== Prologfy ======================'),
    write_ln('[1] - Inserir ou remover músicas'),
    write_ln('[2] - Inserir ou remover albuns'),
    write_ln('[3] - Encontrar música/álbum'),
    write_ln('[4] - Encerrar programa'),
    write_ln('====================== Prologfy ======================'),
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : handle_music(),
            "2" : handle_album(),
            "3" : handle_search(),
            "4" : exit()
        ],
        menu
    ).

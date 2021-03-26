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
    write_ln('[1] - Inserir álbum'),
    write_ln('[2] - Remover álbum'),
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : addAlbum(),
            "2" : removeAlbum()
        ],
        main
    ).

handle_music:-
    write_ln('[1] - Inserir música'),
    write_ln('[2] - Remover música'),
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : addMusic(),
            "2" : removeMusic()
        ],
        main
    ).

handle_search:-
    write_ln('[1] - Buscar músicas de um artista'),
    write_ln('[2] - Buscar músicas de um álbum'),
    write_ln('[3] - Buscar músicas de um ano'),
    write_ln('[4] - Buscar gêneros musicais de um artista'),
    write_ln('[5] - Buscar músicas por gênero'),
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : musicasArtista(),
            "2" : musicasAlbum(),
            "3" : musicasAno(),
            "4" : artistasGenero(),
            "5" : musicasGenero()
        ],
        main
    ).

exit:-
    write_ln('Até mais!!'),
    halt(0).

main:-
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
        main
    ).
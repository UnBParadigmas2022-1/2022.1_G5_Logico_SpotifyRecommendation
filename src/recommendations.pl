:- [src/data/database].
:- (dynamic music/6, genre/1).


print_formated([]).
print_formated([A|B]) :-
    format('Nome da música => ~w ~n', A),
    print_formated(B).

print_artists([]).
print_artists([A|B]) :-
    format('Nome do artista => ~w ~n', A),
    print_artists(B).

recommend_by_genre(G) :-
    findall(Track,
            music(G,
                  _,
                  Track,
                  _,
                  _,
                  _),
            Tracks),
    print_formated(Tracks).

% Recommendation by artist
recommend_by_artist:-
    clear,
    write("###### Recomendação por Artista ######"),
    nl,
    write("[1] - Listar todos os artistas"),
    nl,
    write("[2] - Listar todas as músicas de um artista"),
    nl,
    write("[3] - Obter recomendação de um artista"),
    nl,
    write("[0] - Voltar"),
    nl,
    read_string(user, "\n", "\r", _, Option),
    switch(Option,
            [ "1":list_artists,
              "2":list_songs_by_artist,
              "3":recommend_by_artist_name,
              "0":music_recommendation
            ],
            recommend_by_artist).

list_songs_by_artist :-
    write("Digite o nome do artista: "),
    read_string(current_input, "\n", " \t", _Sep, Artist),
    findall(Track,
            music(_,
                  Artist,
                  Track,
                  _,
                  _,
                  _),
            Tracks),
    print_formated(Tracks),    
    write("Aperte enter para continuar..."),
    get_single_char(_).

list_artists :-
    findall(Artist,
            music(_,
                  Artist,
                  _,
                  _,
                  _,
                  _),
            Artists),
    print_artists(Artists),
    write("Aperte ENTER para continuar..."),
    get_single_char(_).

recommend_by_artist_name :-
    write("Digite o nome do artista: "),
    read_string(current_input, "\n", " \t", _Sep, Artist),
    findall(Track,
            music(_,
                  Artist,
                  Track,
                  _,
                  _,
                  _),
            Tracks),
    print_formated(Tracks),
    write("Aperte ENTER para continuar..."),
    get_single_char(_).
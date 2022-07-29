:- [funcs].
:- [recommendations].


music_recommendation :-
    clear,
    write('\n######## Menu de Recomendações ########'),
    nl,
    write('[1] - Recomendação por Aleatório'),
    nl,
    write('[2] - Recomendação por Artista'),
    nl,
    write('[3] - Recomendação por Dançabilidade'),
    nl,
    write('[4] - Recomendação por Duração'),
    nl,
    write('[5] - Recomendação por Gênero'),
    nl,
    write('[6] - Recomendação por Popularidade'),
    nl,
    write('[0] - Encerrar Programa'),
    nl,
    read_string(user, "\n", "\r", _, Option),
    switch(Option,
           
           [ "1":random,
             "2":artist,
             "3":danceability,
             "4":duration,
             "5":recommend_by_genre,
             "6":recommend_by_popularity,
             "0":exit
           ],
           music_recommendation).
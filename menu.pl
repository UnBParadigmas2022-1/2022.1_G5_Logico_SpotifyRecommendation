:- [funcs].


music_recommendation :- 
    clear,
    write('\n######## Menu de Recomendações ########'),nl,
    write('[1] - Recomendação por Aleatório'),nl,
    write('[2] - Recomendação por Artista'),nl,
    write('[3] - Recomendação por Dançabilidade'),nl,
    write('[4] - Recomendação por Duração'),nl,
    write('[5] - Recomendação por Gênero'),nl,
    write('[6] - Recomendação por Popularidade'),nl,
    write('[0] - Encerrar Programa'),nl,
    read_string(user, "\n", "\r", _, Option),
        switch(
        Option, 
        [
            "1" : aleatorio, %cada um desses será uma função
            "2" : artista, %cada um desses será uma função
            "3" : dancabilidade, %cada um desses será uma função
            "4" : duracao, %cada um desses será uma função
            "5" : genero, %cada um desses será uma função
            "6" : popularidade, %cada um desses será uma função
            "0" : exit
        ],
        music_recommendation
    ).
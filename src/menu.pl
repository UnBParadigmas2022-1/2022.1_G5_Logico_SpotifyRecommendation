:- use_module(library(tabular)).
:- use_module(library(autowin)).
:- use_module(library(pce)).
:- [funcs].
:- [recommendations].


solve(D, Row, Column) :-
    writeln(solve(D, Row, Column)).

% music_recommendation :-
%     % clear,
%     write('\n######## Menu de Recomendações ########'),
%     nl,
%     write('[1] - Recomendação por Aleatório'),
%     nl,
%     write('[2] - Recomendação por Artista'),
%     nl,
%     write('[3] - Recomendação por Dançabilidade'),
%     nl,
%     write('[4] - Recomendação por Duração'),
%     nl,
%     write('[5] - Recomendação por Gênero'),
%     nl,
%     write('[6] - Recomendação por Popularidade'),
%     nl,
%     write('[0] - Encerrar Programa'),
%     nl,
%     read_string(user, "\n", "\r", _, Option),
%     switch(Option,

%            [ "1":random,
%              "2":artist,
%              "3":danceability,
%              "4":duration,
%              "5":recommend_by_genre,
%              "6":popularity,
%              "0":exit
%            ],
%            music_recommendation).

music_recommendation :-
    new(Dialog, dialog('Escolha uma opcao para recomendacao')),
    send_list(Dialog,
              append,

              [
                new(S, new(S, menu(recomendacao))),
                button(cancel, message(Dialog, destroy)),
                button(enter,
                       and(message(@prolog,
                                   menu_switch,
                                   S?selection
                                   ),
                           message(Dialog, destroy)))
              ]),
    send_list(S,
              append,

              [ 'Aleatorio',
                'Artista',
                'Dançabilidade',
                'Duracao',
                'Genero',
                'Popularidade'
              ]),
    send_list(D, append, [research, development, marketing]),
    send(Dialog, default_button, enter),
    send(Dialog, open).

    menu_switch(Option) :-
    write(Option),
    switch(Option,

        [ 'Aleatorio':random,
            'Artista':artist,
            'Dançabilidade':danceability,
            'Duracao':duration,
            'Genero':recommend_by_genre,
            'Popularidade':popularity
        ], music_recommendation).
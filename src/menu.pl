:- use_module(library(tabular)).
:- use_module(library(autowin)).
:- use_module(library(pce)).
:- [src/funcs].
:- [src/recommendation/genre].
:- [src/recommendation/popularity].


solve(D, Row, Column) :-
    writeln(solve(D, Row, Column)).

start:- music_recommendation.

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
    send(Dialog, default_button, enter),
    send(Dialog, open).

    menu_switch(Option) :-
    write(Option),
    switch(Option,

        [ 'Aleatorio':random,
            'Artista':menu_recommend_by_artist,
            'Dançabilidade':danceability,
            'Duracao':duration,
            'Genero':menu_recommend_by_genre,
            'Popularidade':recommend_by_popularity
        ], music_recommendation).

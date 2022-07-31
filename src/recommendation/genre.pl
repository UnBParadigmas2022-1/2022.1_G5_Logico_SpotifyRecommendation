use_module(library(readutil)).
:- [data/database].
:- [funcs].

:- (dynamic music/6, genre/1).


append_track([], D).
append_track([A|B], D) :-
    % appenda nome da track que esta na lista
    send(D, append, text(A)),
    append_track(B, D).


menu_recommend_by_genre :-
    new(Dialog, dialog('Recomendacao por Genero')),
 send_list(Dialog, append,
 [ new(N1, text_item(genero)),
    button(cancel, message(Dialog, destroy)),
    button(enter, and(message(@prolog,
    recommend_by_genre,
    N1?selection),
    message(Dialog, destroy)))
 ]),
 send(Dialog, open).


recommend_by_genre(G) :-
new(D, dialog('Recomendacoes')),
findall(Track,
    music(G,
          _,
          Track,
          _,
          _,
          _),
    Tracks),
append_track(Tracks, D),
send(D, open).
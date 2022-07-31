:- use_module(library(readutil)).
:- [src/data/database].
:- [src/funcs].

:- (dynamic music/6, genre/1).


append_track([], D).
append_track([A|B], D) :-
    % appenda nome da track que esta na lista
    send(D, append, text(A)),
    append_track(B, D).

menu_recommend_by_genre :-
    new(Dialog, dialog('Recomendacao por Genero')),
 send_list(Dialog, append,
 [ new(N1, menu(genero, cycle)),
    button(cancel, message(Dialog, destroy)),
    button(enter, and(message(@prolog,
    recommend_by_genre,
    N1?selection),
    message(Dialog, destroy)))
 ]),
 forall(genre(G), send_list(N1, append, G)),
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
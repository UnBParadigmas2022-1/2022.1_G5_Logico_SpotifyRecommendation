:- use_module(library(readutil)).
:- [src/data/database].
:- [src/funcs].

:- (dynamic music/6, genre/1, artist/1).


append_track([], D).
append_track([A|B], D) :-
    % appenda nome da track que esta na lista
    send(D, append, text(A)),
    append_track(B, D).

append_artist([], D).
append_artist([A|B], D) :-
    % appenda nome do artista que esta na lista
    send(D, append, text(A)),
    append_artist(B, D).

menu_recommend_by_artist :-
    new(Dialog, dialog('Recomendacao por Artista')),
 send_list(Dialog, append,
 [ new(N1, menu(artista, cycle)),
    button(cancel, message(Dialog, destroy)),
    button(enter, and(message(@prolog,
    recommend_by_artist,
    N1?selection),
    message(Dialog, destroy)))
 ]),
 forall(artist(A), send_list(N1, append,A)),
 send(Dialog, open).


recommend_by_artist(Artist) :-
new(D, dialog('Musicas Recomendadas')),
findall(Track,
    (music(_,Artist,Track, _, _, _)),
    Tracks),
append_track(Tracks, D),
send(D, open).

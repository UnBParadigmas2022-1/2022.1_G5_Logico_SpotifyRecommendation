use_module(library(readutil)).
:- [data/database].
:- [funcs].

append_track([], D).
append_track([A|B], D) :-
    % appenda nome da track que esta na lista
    send(D, append, text(A)),
    append_track(B, D).


menu_recommend_by_popularity :-
    new(Dialog, dialog('Recomendacao por Popularidade')),
 send_list(Dialog, append,
 [ new(N1, text_item(genero)),
    button(cancel, message(Dialog, destroy)),
    button(enter, and(message(@prolog,
    recommend_by_popularity,
    N1?selection),
    message(Dialog, destroy)))
 ]),
 send(Dialog, open).


recommend_by_popularity :-
    findall(Pop-Track,
            music(_,
                  _,
                  Track,
                  Pop,
                  _,
                  _),
            PopsTracks),
    keysort(PopsTracks, Sorted),
    print_formated(Sorted).
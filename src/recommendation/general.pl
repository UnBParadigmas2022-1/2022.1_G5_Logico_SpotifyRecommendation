:- use_module(library(readutil)).
:- [src/data/database].
:- [src/funcs].

:- (dynamic music/6, genre/1).

menu_general_recommend :-
    new(Dialog, dialog('Recomendacao Geral')),
    send_list(Dialog,
              append,
              
              [ new(Gen, menu(genero, cycle)),
                new(Dan, slider(dancabilidade, 0, 100, 50)),
                new(Dun, slider(duracao, 0, 10, 3)),
                button(cancel, message(Dialog, destroy)),
                button(enter,
                       and(message(@prolog,
                                   general_recommend,
                                   Gen?selection,
                                   Dan?selection,
                                   Dun?selection),
                           message(Dialog, destroy)))
              ]),
    forall(genre(G), send_list(Gen, append, G)),
    send(Dialog, open).


general_recommend(G, Dan, Dur) :-
    new(D, dialog('Musicas Recomendadas')),
    findall(Track,
            ( music(G,
                    _,
                    Track,
                    _,
                    Da,
                    Du),
              Da*100=<Dan,
              Du/60000=<Dur
            ),
            Tracks),
    append_text_dialog(Tracks, D),
    send(D, open).
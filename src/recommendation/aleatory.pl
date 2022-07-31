:- [src/data/database].
:- [src/funcs].

append_track([], D).
append_track([A|B], D) :-
    % appenda nome da track que esta na lista
    send(D, append, text(A)),
    append_track(B, D).

recommend_by_aleatority :-
    new(D, dialog('Recomendacoes')),
    findall(Track,
            music(_,
                  _,
                  Track,
                  _,
                  _,
                  _),
            Tracks),
    remove_dups(Tracks, ParsedTracks),
    random_permutation(ParsedTracks, RandomParsedTracks),
    sublist(RandomParsedTracks, 0, 5, TopTracks),
    append_track(TopTracks, D),
    send(D, open).

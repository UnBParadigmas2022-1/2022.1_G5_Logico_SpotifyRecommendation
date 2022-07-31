:- [src/data/database].
:- [src/funcs].


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
    append_text_dialog(TopTracks, D),
    send(D, open).

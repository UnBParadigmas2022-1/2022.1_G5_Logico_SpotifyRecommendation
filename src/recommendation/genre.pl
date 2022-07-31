:- [data/database].
:- (dynamic music/6, genre/1).


print_formated([]).
print_formated([A|B]) :-
    format('TrackName => ~w ~n', A),
    print_formated(B).

recommend_by_genre(G) :-
    findall(Track,
            music(G,
                  _,
                  Track,
                  _,
                  _,
                  _),
            Tracks),
    print_formated(Tracks).
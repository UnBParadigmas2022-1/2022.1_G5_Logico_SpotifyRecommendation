:- [data/database].
:- (dynamic music/6, genre/1, popularity/4).


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

recommend_by_popularity(P) :-
    findall(Track,
            music(_,
                  _,
                  Track,
                  P,
                  _,
                  _),
            Tracks),
    print_formated(Tracks).
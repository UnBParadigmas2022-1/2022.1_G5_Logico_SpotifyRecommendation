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
    new(D, dialog('Recomendacoes')),

    % get a pair set with Popularity and Track
    findall(Popularity-Track,
            music(_,
                  _,
                  Track,
                  Popularity,
                  _,
                  _),
            TracksWithPopularity),

    % sort pair set by Key (popularity)
    keysort(TracksWithPopularity, SortedPair),

    % get the value of pair set (tracks name)
    pairs_values(SortedPair, SortedTracks),

    % remove duplicated songs
    remove_dups(SortedTracks, ParsedTracks),

    % reverse list to get the descendent sort
    reverse(ParsedTracks, ReversedTracks),
  
    % get the X firsts elements of list
    sublist(ReversedTracks,0,10,TopTracks),

    % append track to interface
    append_track(TopTracks, D),
    send(D, open).
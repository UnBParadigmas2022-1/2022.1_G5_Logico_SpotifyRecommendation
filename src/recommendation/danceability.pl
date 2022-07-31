use_module(library(readutil)).
:- [src/data/database].
:- [src/funcs].

append_track([], D).
append_track([A|B], D) :-
    % appenda nome da track que esta na lista
    send(D, append, text(A)),
    append_track(B, D).


recommend_by_danceability :-
    new(D, dialog('Recomendacoes')),

    % get a pair set with Danceability and Track
    findall(Danceability-Track,
            music(_,
                  _,
                  Track,
                  _,
                  Danceability,
                  _),
            TracksWithDanceability),

    % sort pair set by Key (Danceability)
    keysort(TracksWithDanceability, SortedPair),

    % get the value of pair set (tracks name)
    pairs_values(SortedPair, SortedTracks),

    % remove duplicated songs
    remove_dups(SortedTracks, ParsedTracks),

    % reverse list to get the descendent sort
    reverse(ParsedTracks, ReversedTracks),
  
    % get the X firsts elements of list
    sublist(ReversedTracks,0,35,TopTracks),

    % append track to interface
    append_track(TopTracks, D),
    send(D, open).
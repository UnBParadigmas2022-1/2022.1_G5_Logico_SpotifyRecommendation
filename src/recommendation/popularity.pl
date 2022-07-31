use_module(library(readutil)).
:- [src/data/database].
:- [src/funcs].


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
    sublist(ReversedTracks, 0, 35, TopTracks),

    % append track to interface
    append_text_dialog(TopTracks, D),
    send(D, open).
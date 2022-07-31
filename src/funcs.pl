clear :- write('\e[H\e[2J').

switch(_, [], ReturnTo) :- write('Opção inválida'),nl, call(ReturnTo).
switch(X, [Val:Goal|Cases], ReturnTo) :-
    ( X==Val ->
        call(Goal),
        call(ReturnTo);
        switch(X, Cases, ReturnTo)
    ).

exit:- write('Encerrado'),nl, halt(0).

% remove_dups(+List, -NewList): % New List isbound to List, but with duplicate items removed.
remove_dups([], []).

remove_dups([First | Rest], NewRest) :- member(First, Rest), remove_dups(Rest, NewRest).

remove_dups([First | Rest], [First | NewRest]) :- not(member(First, Rest)), remove_dups(Rest, NewRest).
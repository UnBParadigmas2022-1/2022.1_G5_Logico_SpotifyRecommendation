clear :- write('\e[H\e[2J').

switch(_, [], ReturnTo) :- write('Opção inválida'),nl, call(ReturnTo).
switch(X, [Val:Goal|Cases], ReturnTo) :-
    ( X==Val ->
        call(Goal),
        call(ReturnTo);
        switch(X, Cases, ReturnTo)
    ).

exit:- write('Encerrado'),nl, halt(0).
% Limpa a tela
clear :- write('\e[H\e[2J').

% Define um predicado switch case para validar opções do input
switch(_, [], ReturnTo) :- write('Opção inválida'),nl, call(ReturnTo).
switch(X, [Val:Goal|Cases], ReturnTo) :-
    ( X==Val ->
        call(Goal),
        call(ReturnTo);
        switch(X, Cases, ReturnTo)
    ).

% Finaliza o programa
exit:- write('Encerrado'),nl, halt(0).
clear :-
    write('\033\[H\033\[2J').

switch(_, [], ReturnTo) :-
    write('Opção inválida'),
    nl,
    call(ReturnTo).
switch(X, [Val:Goal|Cases], ReturnTo) :-
    (   X==Val
    ->  call(Goal),
        call(ReturnTo)
    ;   switch(X, Cases, ReturnTo)
    ).

exit :-
    write('Encerrado'),
    nl,
    halt(0).

% remove_dups(+List, -NewList): % New List isbound to List, but with duplicate items removed.
remove_dups([], []).
remove_dups([First|Rest], NewRest) :-
    member(First, Rest),
    remove_dups(Rest, NewRest).
remove_dups([First|Rest], [First|NewRest]) :-
    not(member(First, Rest)),
    remove_dups(Rest, NewRest).

% create a sublist from a list
sublist(L, M, N, S) :-
    findall(E, (nth1(I, L, E), I >= M, I =< N), S).

% appenda text to dialog
append_text_dialog([], D).
append_text_dialog([A|B], D) :-
    send(D, append, text(A)),
    append_text_dialog(B, D).
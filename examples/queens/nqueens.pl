
:- module(nqueens,[main/1,all/1],[objects]).

:- use_module(engine(io_basic)).
:- use_module(write_board).

:- use_class(queen).
:- use_class(nulqueen).

main([N]):-
    set_problem(N,Queen),
    put_solution(N,Queen).

all(N):-
    set_problem(N,Queen),
    backtrack(N,Queen).

backtrack(N,Queen):-
    put_solution(N,Queen),
    Queen:next,
    backtrack(N,Queen).
backtrack(_N,_Queen):-
    display('There are no more solutions.'),
    nl.

set_problem(N,LastQueen):-
    Queen new nulqueen,
    board(N,N,Queen,LastQueen),
    LastQueen:solve.

put_solution(N,Queen):-
    Queen:solution(S),
    display(S), nl,
    write_board(S,N).

board(0,_N,Queen,Queen):- !.
board(M,N,Queen,LastQueen):-
    M1 is M-1,
    NewQueen new queen(M,N,Queen),
    board(M1,N,NewQueen,LastQueen).

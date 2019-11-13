:- module(_,_,[]).

:- use_package(objects).

:- use_class(stack).

:- use_module(engine(io_basic)).

test :-
    X new stack,
    X:push(a),
    X:push(b),
    X:pop(E1), display(E1),
    X:pop(E2), display(E2),
    X:is_empty.

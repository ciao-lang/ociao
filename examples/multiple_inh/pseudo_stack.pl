%%----------------------------------%%
%% A generic class to perform       %%
%% item storage keeping a history   %%
%% of the item values.              %%
%%----------------------------------%%
:- class(pseudo_stack).

%% Implements class "generic" via a "stack"

:- inherit_class(ociao_examples(stack)).
:- implements(ociao_examples(generic)).

:- use_module(engine(io_basic)).

callme :-
    display('Stack implementation'),
    nl.

set(Item) :-
    push(Item).

get(Item) :-
    top(Item).

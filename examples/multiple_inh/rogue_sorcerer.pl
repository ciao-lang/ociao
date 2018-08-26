:- class(rogue_sorcerer).

:- use_module(library(random)).
:- use_module(engine(io_aux), [message/1]).

:- implements(rogue).
:- implements(sorcerer).

steal(R) :-
	random(0,100,R),
	message(['I have stolen ',R,' gold pieces']).

:- data available_spell/1.

available_spell(hold_person).
available_spell(magic_arrow).
available_spell(healling).
available_spell(healling).
available_spell(healling).

cast_spell(Spell) :-
	retract_fact(available_spell(Spell)),
	!,
	message(['Spell: ',Spell]).

cast_spell(_) :-
	message(['Uhhh ?']).

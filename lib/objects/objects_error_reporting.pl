%%------------------------------------------------------------------------
%%
%% O'Ciao: Object Oriented Programming in Ciao/Prolog
%%
%% ERROR REPORTING
%%
%% AUTHOR : Angel Fernandez Pineda
%% DATE   : July 1999
%%
%%------------------------------------------------------------------------

:- module(objects_error_reporting,
	[
	    start_of_messages/2,
	    end_of_messages/1,
	    message/3
	]).

%%------------------------------------------------------------------------

:- data message_of/3.          % Keep Tracking of error messages.
:- data doing_what/2.          % Currently doing DOING_MESSAGE.

:- use_module(library(compiler/c_itf), [module_error/0]).
:- use_module(engine(messages_basic), [message/2]).
:- use_module(engine(runtime_control), [current_prolog_flag/2]).

%%------------------------------------------------------------------------


start_of_messages(Module,DoingWhat) :-
	retractall_fact(message_of(Module,_,_)),
	retractall_fact(doing_what(Module,_)),
	asserta_fact(doing_what(Module,DoingWhat)).

end_of_messages(Module) :-
	current_prolog_flag(verbose_compilation,on),
	!,
	dump_messages(Module).

end_of_messages(Module) :-
	( message_of(Module,error,_) ; message_of(Module,warning,_) ),
	!,
	dump_messages(Module).

end_of_messages(_).

dump_messages(Module) :-
	doing_what(Module,Doing),
	message(user, ['{'|Doing]),
	message_of(Module,Kind,Message),
	messages_basic:message(Kind,Message),
	fail.

dump_messages(_) :-
	message(user, ['}']).

:- set_prolog_flag(multi_arity_warnings,off).

message(Module,Kind,Message) :-
	assertz_fact(message_of(Module,Kind,Message)),
	(Kind = error -> set_fact(module_error) ; true ).

% 1
start :-
	select([1,2,3,5],[1,2,3],4).
	% select([1,2,3,4],[1,2,3],4).


interval_member(Integer,List,IntegerMin,IntegerMax) :-
	member(Integer, List),
	IntegerMin < Integer,
	Integer < IntegerMax.

% 2

% if List is a list 
list([]).
list([_ | L]) :- list(L).

% 3

select(_,[],[]).
select(H, [H | Tail1], L2) :- Tail1 = L2.
select(Elem, [H | Tail1], [H | Tail2]) :- select(Elem, Tail1, Tail2).

% select(Elem, [Head1|Tail1], [Head2|Tail2]) :-
%     Head1 is Elem,
%     Tail1 = [Head2|Tail2];
%     Head1 is Head2,
%     select(Elem, Tail1, Tail2).

% 4

ordered([]).
ordered([_]).
ordered([X1 | [X2 | Tail]]) :-
    X1 =< X2,
    ordered([X2 | Tail]).

% 5

one.
two :- true; true.
three :- true; two.
infinity :- repeat, true.

%6

sublist(L1, L2) :- append(_, Y, L2), append(L1, _, Y).
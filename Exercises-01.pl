% Exercises-01

not(0,1).
not(1,0).

and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

xor(0,0,0).
xor(1,0,1).
xor(0,1,1).
xor(1,1,0).

% 2
halfadder(Bit1,Bit2,Sum,Carry) :-
  and(Bit1,Bit2,Carry),
  not(Carry,X),
  or(Bit1,Bit2,Y),
  and(X,Y,Sum).

fulladder(Bit1,Bit2,CarryIn,Sum,CarryOut) :-
  xor(Bit1, Bit2, Bit3),
  xor(Bit3, CarryIn, Sum),

  and(Bit1, Bit2, Bit4),
  and(Bit4, CarryIn, Bit5),
  or(Bit4, Bit5, CarryOut).

% 4
factorial(0, 1).
factorial(Integer1, Integer2) :-
  Integer1 > 0,
  Integer3 is Integer1 - 1,
  factorial(Integer3, Integer4),
  Integer2 is Integer1 * Integer4.


% 5

ingredient(pizza,sauce).
ingredient(pizza,ham).
ingredient(pizza,cheese).
ingredient(ham,meat).
ingredient(ham,salt).
ingredient(cheese,milk).
ingredient(cheese,salt).
ingredient(sauce,tomato).
ingredient(sauce,water).
ingredient(sauce,salt).

component(X,Y) :- ingredient(Y,X).
component(X,Y) :- ingredient(Z,X), component(Z,Y).



% start :-
%   factorial(5, X).
% Exercise 2
:- ensure_loaded(logic).

tautology(XFml) :- 

truthtable(XFml) :-
    to_internal(XFml,Fml),
    get_atoms(Fml,Atoms),
    write_tt_title(Fml,Atoms),
    generate(Atoms,V),
    tt(Fml,V,TV),
    write_tt_line(Fml,V,TV),
    fail.
truthtable(_).
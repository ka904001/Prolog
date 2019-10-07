domains
i = integer
list = i*
predicates
nondeterm replace(i,i,list,list)
nondeterm run
nondeterm do(char)
clauses
	replace(P,X,[H|T],[H|T1]):-
		P<>1,
		NP=P-1,
		change(NP,X,T,T1).
	replace(1,X,[_|T],[X|T1]):-
		change(0,X,T,T1).
	replace(_,_,[],[]).
	run:-
		write("\n******Enter******\n"),
		write(" 1 to start\n"),
		write(" 0 to EXIT\n"),
		write("*****************\n"),
		write(">>"),
		readchar(X),
		write(X),
		nl,
		do(X),
		run.
	do('1'):-
		write("Enter your list>>"),
		readterm(list, Source),
		write("Enter position>>"),
		readint(Position),
		write("Enter your number>>"),
		readint(X),
		replace(Position,X,Source,Result),
		write(Result).
	do('0'):-
		write("That's all."), exit.
	do(_):-
		write("Bad value\n\n").
goal
	run.

domains
	list = integer*
	i = integer
	listc = char*
predicates
	nondeterm delete_1(list, list)		/* Удаляет элементы списка на нечетных позициях */
	nondeterm run()
	nondeterm do(char)
clauses
	delete_1([_, H|T1], [H|T2]):-
		/*Если удалось выделить два элемента списка, первый - нечетный и не учитывается */
		delete_1(T1, T2).
	delete_1([], []).
		/* Пустой список не несет больше элементов */
	delete_1([_], []).
		/* Если остался один элемент, то он нечетный и не учитываеся */
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
		readterm(list, List),
		delete_1(List, Result),
		write("The result is:\n"),
		write(Result).
	do('0'):-
		write("That's all."), exit.
	do(_):-
		write("Bad value\n\n").
	
goal
	run.

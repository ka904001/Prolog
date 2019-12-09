domains
		i = integer
		list = char*
	predicates
		nondeterm to_m_base(i, i, list, list)	/* Переводит число в м-ную систему счисления */
		nondeterm run()				/* меню */
		nondeterm do(char)			/* исполнительный блок меню */
		nondeterm push_front(char, list, list)	/* добавляет символ в голову списка */
		nondeterm to_hex(char, i)		/* Переводит число в цифру(символ) м-ной системы счисления */
		nondeterm exec(i, i)			/* Обрабатывает ввод */
	clauses
		to_m_base(M, Num, L, Result):-
			/* Если пришедшее число не нулевое, то оно делится по модулю новой системы счисления и получившийся результат переводится в цифру м-ной системы счисления, результат добавляется в голову списка*/
			Num <> 0,
			A = (Num mod M),
			to_hex(H, A),
			push_front(H, L, L1),
			NNum = Num div M,
			to_m_base(M, NNum, L1, Result).
		to_m_base(_, 0, L, L). 
			/* Нуль означает окончание процеса перевода, результат получен */
		to_hex(H, X):- 
			/* Если число меньше 10, то в м-ной системе счисления число отображается его же цифрой, иначе число отображается латинскими буквами, начиная с A */
			X < 10,
			NX = X + 48,
			char_int(H, NX).
		to_hex(H, X):-
			X > 9,
			NX = X + 55,
			char_int(H, NX).
		exec(M, 0):-
			/* Если пришедшее число равно нулю, то выводится список с 0, иначе вызывается предикат перевода в м-ную систему счисления */
			write("Your number in ", M, " base is:\n"),
			Result = [0],
			write(Result).
		exec(M, Num):-
			to_m_base(M, Num, [], Result),
			write("Your number in ", M, " base is:\n"),
			write(Result).
		push_front(X, L, [X|L]).
			/* Добавляет элемент в голову списка */
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
			write("M>>"),
			readint(M),	/* Ввод системы счисления */
			write("Number>>"),
			readint(Num),	/* Ввод числа*/
			exec(M, Num).	/* Обработка числа */
		do('0'):-
			write("That's all."), exit.
		do(_):-
			write("Bad value\n\n").
	goal
		run.

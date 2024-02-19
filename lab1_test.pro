predicates
	nondeterm male(symbol)
	nondeterm female(symbol)
	nondeterm father(symbol, symbol) % 1 parameter - father, 2 parameter - child
	nondeterm mother(symbol, symbol). % 1 parameter - mother, 2 parameter - child 
	nondeterm couple(symbol, symbol).
	nondeterm sibling(symbol, symbol).
clauses
	%1st generation
	male("Alexey").
	female("Natalya Naryshkina").
	female("Mariya Miloslavskaya").
	
	%2nd generation
	%left branch
	mother("Mariya Miloslavskaya", "Sofiya").
	mother("Mariya Miloslavskaya", "Ivan V").
	mother("Mariya Miloslavskaya", "Fedor II").
	father("Alexey", "Sofiya").
	father("Alexey", "Ivan V").
	father("Alexey", "Fedor II").
	
	%right branch
	mother("Natalya Naryshkina", "Petr I").
	mother("Natalya Naryshkina", "Ekaterina I").
	father("Alexey", "Petr I").
	father("Alexey", "Ekaterina I").
	
	
	
	couple(Husband, Wife) :- father(Husband, Child), mother(Wife, Child).
	sibling(Brother, Sister) :- father(Father, Brother), father(Father, Sister), mother(Mother, Brother), mother(Mother, Sister). 
	
	
goal
	%couple(Who, "Mariya Miloslavskaya").
	sibling(Who, "Sofiya").

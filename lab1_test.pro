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
	
	mother("Mariya Miloslavskaya", "Sofiya").
	mother("Mariya Miloslavskaya", "Ivan V").
	mother("Mariya Miloslavskaya", "Fedor II").
	mother("Natalya Naryshkina", "Petr I").
	mother("Ekaterina I", "Anna").
	mother("Ekaterina I", "Elizaveta").
	mother("Ekaterina", "Anna Lesopoldovna").
	mother("Anna", "Petr III").
	mother("Anna Lesopoldovna", "Ivan VI").
	
	father("Alexey", "Sofiya").
	father("Alexey", "Ivan V").
	father("Alexey", "Fedor II").
	father("Alexey", "Petr I").
	father("Alexey", "Ekaterina I").
	father("Ivan V", "Anna Ioanovna").
	father("Ivan V", "Ekaterina").
	father("Petr I", "Anna").
	father("Petr I", "Elizaveta").
	father("Herzorg Meklenbursky", "Anna Lesopoldovna").
	father("Herzog Golsteinsky", "Petr III").
	father("Prince Anton Brownschweighsky", "Ivan VI").
	

	
	
	
	couple(Husband, Wife) :- father(Husband, Child), mother(Wife, Child).
	sibling(Brother, Sister) :- father(Father, Brother), father(Father, Sister), mother(Mother, Brother), mother(Mother, Sister). 
	
	
goal
	couple(Who, "Anna").
	%sibling(Who, "Elizaveta").

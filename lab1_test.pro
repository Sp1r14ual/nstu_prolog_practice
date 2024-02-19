predicates
	nondeterm male(symbol)
	nondeterm female(symbol)
	nondeterm father(symbol, symbol) % 1 parameter - child, 2 parameter - father
	nondeterm mother(symbol, symbol). % 1 parameter - child, 2 parameter - mother 
	nondeterm couple(symbol, symbol).
clauses
	%1st generation
	male("Alexey").
	female("Natalya Naryshkina").
	female("Mariya Miloslavskaya").
	
	%2nd generation
	mother("Mariya Miloslavskaya", "Sofiya").
	mother("Mariya Miloslavskaya", "Ivan V").
	mother("Mariya Miloslavskaya", "Fedor II").
	father("Alexey", "Sofiya").
	father("Alexey", "Ivan V").
	father("Alexey", "Fedor II").
	
	couple(X, Y) :- father(X, Z), mother(Y, Z). % X - husband, Y - wife
	
	
goal
	couple(Who, "Mariya Miloslavskaya").

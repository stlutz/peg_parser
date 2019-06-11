as yet unclassified
result
	stack := LinkedList new.
	inStack := Set new.
	visited := Set new.
	recursionCount := Dictionary new.
	lowlink := Dictionary new.
	maxRecursionCount := 1.

	result := LinkedList new.

	graph nodes do: [:n |
		(visited includes: n) ifFalse: [self tarjan: n]].
	
	^ (result collect: [:r | r asSet]) asArray
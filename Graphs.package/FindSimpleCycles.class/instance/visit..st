as yet unclassified
visit: n
	stack addFirst: n.
	inStack add: n.

	(graph neighbors: n) do: [:neighbor |
		(currComponent includes: neighbor) ifTrue: [
			(inStack includes: neighbor)
				ifTrue: [self saveCycle: neighbor]
				ifFalse: [self visit: neighbor]]].

	stack removeFirst.
	inStack remove: n.

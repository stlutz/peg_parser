as yet unclassified
tarjan: n
	recursionCount at: n put: maxRecursionCount.
	lowlink at: n put: maxRecursionCount.
	maxRecursionCount := maxRecursionCount + 1.
	stack add: n.
	inStack add: n.
	visited add: n.
	
	(graph neighbors: n) do: [:neighbor |
		(visited includes: neighbor)
			ifFalse: [
				| neighborLowlink |
				self tarjan: neighbor.
				neighborLowlink := lowlink at: neighbor.
				(lowlink at: n) > neighborLowlink ifTrue: [lowlink at: n put: neighborLowlink]]
			ifTrue: [
				(inStack includes: neighbor) ifTrue: [
					| neighborRecursionCount |
					neighborRecursionCount := recursionCount at: neighbor.
					(lowlink at: n) >  neighborRecursionCount ifTrue: [lowlink at: n put: neighborRecursionCount]]]].
	
	((lowlink at: n) = (recursionCount at: n)) ifTrue: [
		| component currentNode |
		component := LinkedList new.
		[currentNode = n] whileFalse: [
			currentNode := stack removeLast.
			inStack remove: currentNode.
			component add: currentNode].
		result add: component].
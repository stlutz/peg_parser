as yet unclassified
test3
	| graph cycles |
	graph := DirectedGraph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 2.
	graph addEdgeFrom: 1 to: 5.
	graph addEdgeFrom: 5 to: 6.
	graph addEdgeFrom: 6 to: 7.
	graph addEdgeFrom: 7 to: 5.
		
	cycles := (FindSimpleCycles new: graph) result.

	self assert: (cycles size) equals: 2.
	self assert: (cycles includes: {2 . 3 . 4}).
	self assert: (cycles includes: {5 . 6 . 7}).

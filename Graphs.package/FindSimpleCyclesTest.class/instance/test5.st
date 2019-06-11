as yet unclassified
test5
	| graph cycles |
	graph := DirectedGraph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 1.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 2 to: 4.
	graph addEdgeFrom: 3 to: 1.
	graph addEdgeFrom: 4 to: 5.
	graph addEdgeFrom: 4 to: 6.
	graph addEdgeFrom: 5 to: 6.
	graph addEdgeFrom: 6 to: 4.
		
	cycles := (FindSimpleCycles new: graph) result.

	self assert: (cycles size) equals: 4.
	self assert: (cycles includes: {1 . 2}).
	self assert: (cycles includes: {1 . 2 . 3}).
	self assert: (cycles includes: {4 . 5 . 6}).
	self assert: (cycles includes: {4 . 6}).

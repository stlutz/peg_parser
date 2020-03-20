as yet unclassified
test2
	| graph cycles |
	graph := DirectedGraph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 2 to: 1.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 2 to: 4.
	graph addEdgeFrom: 2 to: 5.
	graph addEdgeFrom: 3 to: 2.
	graph addEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 2.
	graph addEdgeFrom: 4 to: 3.
	graph addEdgeFrom: 5 to: 1.
	graph addEdgeFrom: 5 to: 2.
	
	cycles := (FindSimpleCycles new: graph) result.

	self assert: (cycles size) equals: 12.
	self assert: (cycles includes: {1 . 2}).
	self assert: (cycles includes: {2 . 3}).
	self assert: (cycles includes: {2 . 4}).
	self assert: (cycles includes: {2 . 5}).
	self assert: (cycles includes: {3 . 4}).
	self assert: (cycles includes: {1 . 2 . 5}).
	self assert: (cycles includes: {2 . 3 . 4}).
	self assert: (cycles includes: {2 . 4 . 3}).
	self assert: (cycles includes: {1 . 3 . 2}).
	self assert: (cycles includes: {1 . 3 . 2 . 5}).
	self assert: (cycles includes: {1 . 3 . 4 . 2}).
	self assert: (cycles includes: {1 . 3 . 4 . 2 . 5}).

as yet unclassified
test4
	| graph cycles |
	graph := Graph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 1.
	graph addEdgeFrom: 2 to: 4.
		
	cycles := (FindSimpleCycles new: graph) result.

	self assert: (cycles size) equals: 11.
	self assert: (cycles includes: {1 . 2}).
	self assert: (cycles includes: {1 . 4}).
	self assert: (cycles includes: {2 . 3}).
	self assert: (cycles includes: {2 . 4}).
	self assert: (cycles includes: {3 . 4}).
	self assert: (cycles includes: {1 . 2 . 4}).
	self assert: (cycles includes: {1 . 2 . 3 . 4}).
	self assert: (cycles includes: {1 . 4 . 2}).
	self assert: (cycles includes: {1 . 4 . 3 . 2}).
	self assert: (cycles includes: {2 . 3 . 4}).
	self assert: (cycles includes: {2 . 4 . 3}).

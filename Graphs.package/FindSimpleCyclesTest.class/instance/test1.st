as yet unclassified
test1
	| graph cycles |
	graph := Graph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 3 to: 1.

	cycles := (FindSimpleCycles new: graph) result.

	self assert: (cycles size) equals: 5.
	self assert: (cycles includes: {1 . 2}).
	self assert: (cycles includes: {2 . 3}).
	self assert: (cycles includes: {1 . 3}).
	self assert: (cycles includes: {1 . 2 . 3}).
	self assert: (cycles includes: {1 . 3 . 2}).

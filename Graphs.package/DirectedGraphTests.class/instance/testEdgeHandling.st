as yet unclassified
testEdgeHandling
	| graph |
	"create graph"
	graph := DirectedGraph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 2 to: 4.
	graph addEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 1.
	graph addEdgeFrom: 4 to: 3.
	graph addEdgeFrom: 5 to: 5.
	
	"edge existence"
	self assert: (graph hasEdgeFrom: 1 to: 1) not.
	self assert: (graph hasEdgeFrom: 1 to: 2).
	self assert: (graph hasEdgeFrom: 1 to: 3).
	self assert: (graph hasEdgeFrom: 1 to: 4) not.
	self assert: (graph hasEdgeFrom: 1 to: 5) not.

	self assert: (graph hasEdgeFrom: 2 to: 1) not.
	self assert: (graph hasEdgeFrom: 2 to: 2) not.
	self assert: (graph hasEdgeFrom: 2 to: 3) not.
	self assert: (graph hasEdgeFrom: 2 to: 4).
	self assert: (graph hasEdgeFrom: 2 to: 5) not.

	self assert: (graph hasEdgeFrom: 3 to: 1) not.
	self assert: (graph hasEdgeFrom: 3 to: 2) not.
	self assert: (graph hasEdgeFrom: 3 to: 3) not.
	self assert: (graph hasEdgeFrom: 3 to: 4).
	self assert: (graph hasEdgeFrom: 3 to: 5) not.

	self assert: (graph hasEdgeFrom: 4 to: 1).
	self assert: (graph hasEdgeFrom: 4 to: 2) not.
	self assert: (graph hasEdgeFrom: 4 to: 3).
	self assert: (graph hasEdgeFrom: 4 to: 4) not.
	self assert: (graph hasEdgeFrom: 4 to: 5) not.

	self assert: (graph hasEdgeFrom: 5 to: 1) not.
	self assert: (graph hasEdgeFrom: 5 to: 2) not.
	self assert: (graph hasEdgeFrom: 5 to: 3) not.
	self assert: (graph hasEdgeFrom: 5 to: 4) not.
	self assert: (graph hasEdgeFrom: 5 to: 5).
	
	"change graph"
	graph removeEdgeFrom: 2 to: 1.
	graph removeEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 5.
	
	"edge existence"
	self assert: (graph hasEdgeFrom: 2 to: 1) not.
	self assert: (graph hasEdgeFrom: 3 to: 4) not.
	self assert: (graph hasEdgeFrom: 4 to: 5).

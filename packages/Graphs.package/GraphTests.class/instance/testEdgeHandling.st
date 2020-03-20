as yet unclassified
testEdgeHandling
	| graph |
	"create graph"
	graph := Graph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 2 to: 4.
	graph addEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 1.
	graph addNode: 5.
	graph addEdgeFrom: 7 to: 7.
	
	"edge existence"
	self assert: (graph hasEdgeFrom: 1 to: 2).
	self assert: (graph hasEdgeFrom: 2 to: 1).
	self assert: (graph hasEdgeFrom: 1 to: 3).
	self assert: (graph hasEdgeFrom: 3 to: 1).
	self assert: (graph hasEdgeFrom: 2 to: 4).
	self assert: (graph hasEdgeFrom: 4 to: 2).
	self assert: (graph hasEdgeFrom: 3 to: 4).
	self assert: (graph hasEdgeFrom: 4 to: 3).
	self assert: (graph hasEdgeFrom: 4 to: 1).
	self assert: (graph hasEdgeFrom: 1 to: 4).
	
	self assert: (graph hasEdgeFrom: 7 to: 7).
	
	self assert: (graph hasEdgeFrom: 1 to: 5) not.
	self assert: (graph hasEdgeFrom: 2 to: 5) not.
	self assert: (graph hasEdgeFrom: 3 to: 5) not.
	self assert: (graph hasEdgeFrom: 4 to: 5) not.
	self assert: (graph hasEdgeFrom: 2 to: 3) not.
	self assert: (graph hasEdgeFrom: 3 to: 2) not.
	
	"change graph"
	graph removeEdgeFrom: 2 to: 1.
	graph removeEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 5.
	
	"edge existence"
	self assert: (graph hasEdgeFrom: 1 to: 2) not.
	self assert: (graph hasEdgeFrom: 2 to: 1) not.
	self assert: (graph hasEdgeFrom: 3 to: 4) not.
	self assert: (graph hasEdgeFrom: 4 to: 3) not.
	self assert: (graph hasEdgeFrom: 4 to: 5).
	self assert: (graph hasEdgeFrom: 5 to: 4).
	
	self should: [graph hasEdgeFrom: 5 to: 6] raise: KeyNotFound.
	self should: [graph hasEdgeFrom: 6 to: 5] raise: KeyNotFound.

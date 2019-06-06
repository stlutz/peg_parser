as yet unclassified
testNodeHandling
	| graph |
	graph := Graph new.
	graph addNode: 'test'.
	graph addNode: 123.
	graph addNode: #symbol.
	
	self assert: (graph hasNode: 'test').
	self assert: (graph hasNode: 123).
	self assert: (graph hasNode: #symbol).
	self assert: (graph hasNode: 1) not.
	
	graph removeNode: 123.	
	self assert: (graph hasNode: 'test').
	self assert: (graph hasNode: 123) not.

	graph removeNode: 'test'.
	self assert: (graph hasNode: 'test') not.

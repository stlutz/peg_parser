as yet unclassified
testNodeData
	| graph |
	graph := Graph new.
	graph addNode: 1.
	graph addNode: 2.
	graph addNode: 3.
	
	graph nodeData: 1 at: #attr1 put: 'test'.
	graph nodeData: 1 at: 'test' put: 123.
	graph nodeData: 2 at: #attr2 put: 'test2'.
	graph nodeData: 3 at: #attr3 put: #a.

	self assert: (graph nodeData: 1 at: #attr1) equals: 'test'.
	self assert: (graph nodeData: 1 at: 'test') equals: 123.
	self assert: (graph nodeData: 2 at: #attr2) equals: 'test2'.
	self assert: (graph nodeData: 3 at: #attr3) equals: #a.
	self should: [graph nodeData: 2 at: 'test'] raise: KeyNotFound.

	graph nodeData: 1 removeKey: #attr1.
	graph nodeData: 2 removeKey: #attr2.
	graph nodeData: 3 removeKey: #attr3.

	self should: [graph nodeData: 1 at: #attr1] raise: KeyNotFound.
	self assert: (graph nodeData: 1 at: 'test') equals: 123.
	self should: [graph nodeData: 2 at: #attr2] raise: KeyNotFound.
	self should: [graph nodeData: 3 at: #attr3] raise: KeyNotFound.

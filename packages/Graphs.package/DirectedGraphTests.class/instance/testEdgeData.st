as yet unclassified
testEdgeData
	| graph data12 data13 data24|
	graph := DirectedGraph new.

	data12 := Dictionary new.
	data12 at: 'attr1' put: 10.
	data12 at: #a put: 20.
	data13 := Dictionary new.
	data13 at: #weight put: 3.
	data24 := Dictionary new.
	data24 at: 'attr1' put: 10.
	data24 at: #a put: 30.

	graph addEdgeFrom: 1 to: 2 data: data12.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 1 to: 3 data: data13.
	graph edgeDataFrom: 1 to: 3 at: 'attr1' put: 5.
	graph addEdgeFrom: 2 to: 4 data: data24.
	graph addEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 1.	
	graph addEdgeFrom: 5 to: 5.


	self assert: (graph edgeDataFrom: 1 to: 2 at: 'attr1') equals: 10.
	self should: [graph edgeDataFrom: 2 to: 1 at: 'attr1'] raise: KeyNotFound.
	self assert: (graph edgeDataFrom: 1 to: 2 at: #a) equals: 20.
	self should: [graph edgeDataFrom: 2 to: 1 at: #a] raise: KeyNotFound.
	self assert: (graph edgeWeightFrom: 1 to: 2) equals: 1.
	self should: [graph edgeWeightFrom: 2 to: 1] raise: KeyNotFound.

	self assert: (graph edgeDataFrom: 1 to: 3 at: #weight) equals: 3.
	self should: [graph edgeDataFrom: 3 to: 1 at: #weight] raise: KeyNotFound.
	self assert: (graph edgeWeightFrom: 1 to: 3) equals: 3.
	self assert: (graph edgeDataFrom: 1 to: 3 at: 'attr1') equals: 5.
	self should: [graph edgeDataFrom: 3 to: 1 at: 'attr1'] raise: KeyNotFound.
	self should: [graph edgeDataFrom: 1 to: 4 at: #a] raise: KeyNotFound.

	self assert: (graph edgeDataFrom: 2 to: 4 at: 'attr1') equals: 10.
	self assert: (graph edgeDataFrom: 2 to: 4 at: #a) equals: 30.
	self assert: (graph edgeWeightFrom: 2 to: 4) equals: 1.
	
	graph edgeDataFrom: 1 to: 2 removeKey: 'attr1'.
	graph edgeDataFrom: 1 to: 3 removeKey: #weight.

	self should: [graph edgeDataFrom: 1 to: 2 at: 'attr1'] raise: KeyNotFound.
	self should: [graph edgeDataFrom: 2 to: 1 at: 'attr1'] raise: KeyNotFound.
	self assert: (graph edgeDataFrom: 1 to: 2 at: #a) equals: 20.
	self assert: (graph edgeWeightFrom: 1 to: 3) equals: 1.
	self should: [graph edgeWeightFrom: 3 to: 1] raise: KeyNotFound.

as yet unclassified
testEdgeDataSmall
	| graph data13|
	graph := Graph new.

	data13 := Dictionary new.
	data13 at: #weight put: 3.

	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 1 to: 3.
	graph addEdgeFrom: 1 to: 3 data: data13.

	self assert: (graph edgeDataFrom: 1 to: 3 at: #weight) equals: 3.
	self assert: (graph edgeDataFrom: 3 to: 1 at: #weight) equals: 3.
	self assert: (graph edgeWeightFrom: 1 to: 3) equals: 3.

	graph edgeDataFrom: 1 to: 3 removeKey: #weight.

	self assert: (graph edgeWeightFrom: 1 to: 3) equals: 1.
	self assert: (graph edgeWeightFrom: 3 to: 1) equals: 1.

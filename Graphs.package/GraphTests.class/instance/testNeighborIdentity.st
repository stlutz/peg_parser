as yet unclassified
testNeighborIdentity
	| graph dict1 dict2 dict3 dict4 dict5 neighbors1 neighbors2 neighbors3 neighbors4 neighbors5 |
	"create 5 distinct objects"
	dict1 := Dictionary new.
	dict1 at: #key put: 1.
	dict2 := Dictionary new.
	dict2 at: #key put: 2.
	dict3 := Dictionary new.
	dict3 at: #key put: 3.
	dict4 := Dictionary new.
	dict4 at: #key put: 4.
	dict5 := Dictionary new.
	dict5 at: #key put: 5.

	graph := Graph new.
	graph addEdgeFrom: dict1 to: dict2.
	graph addEdgeFrom: dict1 to: dict3.
	graph addEdgeFrom: dict1 to: dict3.
	graph addEdgeFrom: dict2 to: dict4.
	graph addEdgeFrom: dict3 to: dict4.
	graph addEdgeFrom: dict4 to: dict1.
	graph addEdgeFrom: dict5 to: dict5.

	neighbors1 := graph neighbors: dict1.
	neighbors2 := graph neighbors: dict2.
	neighbors3 := graph neighbors: dict3.
	neighbors4 := graph neighbors: dict4.
	neighbors5 := graph neighbors: dict5.

	self assert: (neighbors1 includes: dict1) not.
	self assert: (neighbors1 includes: dict2).
	self assert: (neighbors1 includes: dict3).
	self assert: (neighbors1 includes: dict4).
	self assert: (neighbors1 includes: dict5) not.
	
	self assert: (neighbors2 includes: dict1).
	self assert: (neighbors2 includes: dict2) not.
	self assert: (neighbors2 includes: dict3) not.
	self assert: (neighbors2 includes: dict4).
	self assert: (neighbors2 includes: dict5) not.

	self assert: (neighbors3 includes: dict1).
	self assert: (neighbors3 includes: dict2) not.
	self assert: (neighbors3 includes: dict3) not.
	self assert: (neighbors3 includes: dict4).
	self assert: (neighbors3 includes: dict5) not.

	self assert: (neighbors4 includes: dict1).
	self assert: (neighbors4 includes: dict2).
	self assert: (neighbors4 includes: dict3).
	self assert: (neighbors4 includes: dict4) not.
	self assert: (neighbors4 includes: dict5) not.

	self assert: (neighbors5 includes: dict1) not.
	self assert: (neighbors5 includes: dict2) not.
	self assert: (neighbors5 includes: dict3) not.
	self assert: (neighbors5 includes: dict4) not.
	self assert: (neighbors5 includes: dict5).

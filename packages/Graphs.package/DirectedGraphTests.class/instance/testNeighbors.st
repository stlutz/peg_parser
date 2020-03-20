as yet unclassified
testNeighbors
	| graph predecessors1 predecessors2 predecessors3 predecessors4 predecessors5 successors1 successors2 successors3 successors4 successors5 |
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
	
	"get neighbors"
	predecessors1 := graph predecessors: 1.
	predecessors2 := graph predecessors: 2.
	predecessors3 := graph predecessors: 3.
	predecessors4 := graph predecessors: 4.
	predecessors5 := graph predecessors: 5.
	successors1 := graph successors: 1.
	successors2 := graph successors: 2.
	successors3 := graph successors: 3.
	successors4 := graph successors: 4.
	successors5 := graph successors: 5.

	"check neighbors"
	self assert: (predecessors1 includes: 1) not.
	self assert: (predecessors1 includes: 2) not.
	self assert: (predecessors1 includes: 3) not.
	self assert: (predecessors1 includes: 4).
	self assert: (predecessors1 includes: 5) not.

	self assert: (predecessors2 includes: 1).
	self assert: (predecessors2 includes: 2) not.
	self assert: (predecessors2 includes: 3) not.
	self assert: (predecessors2 includes: 4) not.
	self assert: (predecessors2 includes: 5) not.

	self assert: (predecessors3 includes: 1).
	self assert: (predecessors3 includes: 2) not.
	self assert: (predecessors3 includes: 3) not.
	self assert: (predecessors3 includes: 4).
	self assert: (predecessors3 includes: 5) not.

	self assert: (predecessors4 includes: 1) not.
	self assert: (predecessors4 includes: 2).
	self assert: (predecessors4 includes: 3).
	self assert: (predecessors4 includes: 4) not.
	self assert: (predecessors4 includes: 5) not.

	self assert: (predecessors5 includes: 1) not.
	self assert: (predecessors5 includes: 2) not.
	self assert: (predecessors5 includes: 3) not.
	self assert: (predecessors5 includes: 4) not.
	self assert: (predecessors5 includes: 5).

	self assert: (successors1 includes: 1) not.
	self assert: (successors1 includes: 2).
	self assert: (successors1 includes: 3).
	self assert: (successors1 includes: 4) not.
	self assert: (successors1 includes: 5) not.

	self assert: (successors2 includes: 1) not.
	self assert: (successors2 includes: 2) not.
	self assert: (successors2 includes: 3) not.
	self assert: (successors2 includes: 4).
	self assert: (successors2 includes: 5) not.

	self assert: (successors3 includes: 1) not.
	self assert: (successors3 includes: 2) not.
	self assert: (successors3 includes: 3) not.
	self assert: (successors3 includes: 4).
	self assert: (successors3 includes: 5) not.

	self assert: (successors4 includes: 1).
	self assert: (successors4 includes: 2) not.
	self assert: (successors4 includes: 3).
	self assert: (successors4 includes: 4) not.
	self assert: (successors4 includes: 5) not.

	self assert: (successors5 includes: 1) not.
	self assert: (successors5 includes: 2) not.
	self assert: (successors5 includes: 3) not.
	self assert: (successors5 includes: 4) not.
	self assert: (successors5 includes: 5).

	"change graph"
	graph removeEdgeFrom: 4 to: 3.
	graph addEdgeFrom: 4 to: 5.
	
	"get new neighbors"
	predecessors3 := graph predecessors: 3.
	predecessors5 := graph predecessors: 5.
	successors4 := graph successors: 4.

	"check new neighbors"
	self assert: (predecessors3 includes: 4) not.
	self assert: (predecessors5 includes: 4).
	self assert: (successors4 includes: 3) not.

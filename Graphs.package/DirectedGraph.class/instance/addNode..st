as yet unclassified
addNode: n
	^ nodes at: n ifAbsentPut: [DirectedGraphNode new: n]

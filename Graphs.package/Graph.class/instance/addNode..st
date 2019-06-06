as yet unclassified
addNode: n
	^ nodes at: n ifAbsentPut: [GraphNode new: n]

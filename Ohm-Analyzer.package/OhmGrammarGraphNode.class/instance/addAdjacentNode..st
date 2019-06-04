as yet unclassified
addAdjacentNode: node
	(adjacent includes: node) ifFalse: [adjacent add: node]
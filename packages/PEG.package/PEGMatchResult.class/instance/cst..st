accessing
cst: aNode

	self flag: #todo. "quick and simple for now"
	"OhmSetParentAttribute new value: anObject."
	self connectParents: aNode. "aNode cannot be a terminal"
	cst := aNode.
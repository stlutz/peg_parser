as yet unclassified
addEdgeFrom: u to: v data: aDataDictionary
	| uNode vNode edgeData |
	uNode := self addNode: u.
	vNode := self addNode: v.
	edgeData := IdentityDictionary newFrom: aDataDictionary.
	uNode addAdj: vNode data: edgeData.
	uNode == vNode ifFalse: [vNode addAdj: uNode data: edgeData]
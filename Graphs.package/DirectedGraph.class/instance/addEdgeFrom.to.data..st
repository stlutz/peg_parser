as yet unclassified
addEdgeFrom: u to: v data: aDataDictionary
	| uNode vNode edgeData |
	uNode := self addNode: u.
	vNode := self addNode: v.
	edgeData := IdentityDictionary newFrom: aDataDictionary.
	uNode addSucc: vNode data: edgeData.
	vNode addPred: uNode data: edgeData.

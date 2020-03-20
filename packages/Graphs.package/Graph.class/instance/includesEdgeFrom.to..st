as yet unclassified
includesEdgeFrom: u to: v
	| uNode vNode |
	uNode := nodes at: u.
	vNode := nodes at: v.
	^ uNode includesAdj: vNode
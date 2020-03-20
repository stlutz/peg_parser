as yet unclassified
removeEdgeFrom: u to: v
	| uNode vNode |
	uNode := nodes at: u.
	vNode := nodes at: v.
	uNode removeSucc: vNode.
	vNode removePred: uNode.

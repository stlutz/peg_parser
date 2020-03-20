as yet unclassified
edgeDataFrom: u to: v
	| uNode vNode |
	uNode := nodes at: u.
	vNode := nodes at: v.
	^ uNode adjData: vNode
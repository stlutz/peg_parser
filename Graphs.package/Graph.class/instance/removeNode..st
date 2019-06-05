as yet unclassified
removeNode: n
	| node neighbors |
	node := nodes at: n ifAbsent: [^ nil].
	neighbors := node neighbors.
	neighbors do: [:neighbor |
		neighbor removeAdj: node].
	nodes removeKey: n ifAbsent: []

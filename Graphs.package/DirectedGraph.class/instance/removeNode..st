as yet unclassified
removeNode: n
	| node successors predecessors |
	node := nodes at: n ifAbsent: [^ nil].
	successors := node successors.
	successors do: [:successor |
		successor removePred: node].
	predecessors := node predecessors.
	predecessors do: [:predecessor |
		predecessor removeSucc: node].
	nodes removeKey: n

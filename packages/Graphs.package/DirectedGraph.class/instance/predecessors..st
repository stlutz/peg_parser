as yet unclassified
predecessors: n
	^ (nodes at: n) predecessors collect: [:neighbor | neighbor ident]

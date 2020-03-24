as yet unclassified
parse_pseudoVariableReference_1: t1 
	'self'
		withIndexDo: [:t2 :t3 | t2
					== (string
							at: t1 + t3 - 1
							ifAbsent: [])
				ifFalse: [self reportFailureOf: 'self' atPos: t1.
					^ nil]].
	^ PEGNode
		newOn: #'_terminal'
		for: string
		from: t1
		to: t1 + 'self' size
		children: {'self'}
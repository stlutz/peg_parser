as yet unclassified
parse_MethodReturnOperator: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	'^'
		withIndexDo: [:t3 :t4 | t3
					== (string
							at: t2 + t4 - 1
							ifAbsent: [])
				ifFalse: [self reportFailureOf: '^' atPos: t2.
					^ nil]].
	^ PEGNode
		newOn: #'_terminal'
		for: string
		from: t2
		to: t2 + '^' size
		children: {'^'}
as yet unclassified
parse_constantReference_1: t1 
	'true'
		withIndexDo: [:t2 :t3 | t2
					== (string
							at: t1 + t3 - 1
							ifAbsent: [])
				ifFalse: [self reportFailureOf: 'true' atPos: t1.
					^ nil]].
	^ PEGNode
		newOn: #'_terminal'
		for: string
		from: t1
		to: t1 + 'true' size
		children: {'true'}
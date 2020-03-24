as yet unclassified
parse_constantReference_2: t1 
	'false'
		withIndexDo: [:t2 :t3 | t2
					== (string
							at: t1 + t3 - 1
							ifAbsent: [])
				ifFalse: [self reportFailureOf: 'false' atPos: t1.
					^ nil]].
	^ PEGNode
		newOn: #'_terminal'
		for: string
		from: t1
		to: t1 + 'false' size
		children: {'false'}
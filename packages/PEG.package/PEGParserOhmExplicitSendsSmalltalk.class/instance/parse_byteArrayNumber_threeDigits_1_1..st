as yet unclassified
parse_byteArrayNumber_threeDigits_1_1: t1 
	'1'
		withIndexDo: [:t2 :t3 | t2
					== (string
							at: t1 + t3 - 1
							ifAbsent: [])
				ifFalse: [self reportFailureOf: '1' atPos: t1.
					^ nil]].
	^ PEGNode
		newOn: #'_terminal'
		for: string
		from: t1
		to: t1 + '1' size
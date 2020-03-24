as yet unclassified
parse_byteArrayNumber_threeDigits_1_2: t1 
	'2'
		withIndexDo: [:t2 :t3 | t2
					== (string
							at: t1 + t3 - 1
							ifAbsent: [])
				ifFalse: [self reportFailureOf: '2' atPos: t1.
					^ nil]].
	^ PEGNode
		newOn: #'_terminal'
		for: string
		from: t1
		to: t1 + '2' size
		children: {'2'}
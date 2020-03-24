as yet unclassified
parse_hexDigit_2: t1 
	| t2 |
	t2 := string
				at: t1
				ifAbsent: [^ nil].
	^ ($a <= t2
			and: [t2 <= $f])
		ifTrue: [PEGNode
				newOn: #'_terminal'
				for: string
				from: t1
				to: t1 + 1
				children: {t2}]
		ifFalse: [self reportFailureOf: {$a. $f} atPos: t1.
			nil]
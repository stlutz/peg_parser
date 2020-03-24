as yet unclassified
parse_digit: t1 
	| t2 |
	t2 := string
				at: t1
				ifAbsent: [^ nil].
	^ ($0 <= t2
			and: [t2 <= $9])
		ifTrue: [PEGNode
				newOn: #'_terminal'
				for: string
				from: t1
				to: t1 + 1
				children: {t2}]
		ifFalse: [self reportFailureOf: {$0. $9} atPos: t1.
			nil]
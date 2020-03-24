as yet unclassified
parse_upper: t1 
	| t2 |
	t2 := string
				at: t1
				ifAbsent: [^ nil].
	^ ($A <= t2
			and: [t2 <= $Z])
		ifTrue: [PEGNode
				newOn: #'_terminal'
				for: string
				from: t1
				to: t1 + 1]
		ifFalse: [self reportFailureOf: {$A. $Z} atPos: t1.
			nil]
as yet unclassified
parse_lower: t1 
	| t2 |
	t2 := string
				at: t1
				ifAbsent: [^ nil].
	^ ($a <= t2
			and: [t2 <= $z])
		ifTrue: [PEGNode
				newOn: #'_terminal'
				for: string
				from: t1
				to: t1 + 1]
		ifFalse: [self reportFailureOf: {$a. $z} atPos: t1.
			nil]
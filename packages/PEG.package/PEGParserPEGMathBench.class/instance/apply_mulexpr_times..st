as yet unclassified
apply_mulexpr_times: t1 
	| t2 t3 t4 t5 |
	t2 := self
				recall: #'parse_mulexpr_times'
				withName: #'mulexpr_times'
				atPos: t1.
	t2
		ifNil: [t3 := PEGLeftRecursion newWithSeed: nil withRule: #'parse_mulexpr_times'.
			leftRecursionStack addFirst: t3.
			(memoization at: t1)
				at: #'parse_mulexpr_times'
				put: t3.
			t4 := self parse_mulexpr_times: t1.
			t5 := t4
						ifNotNil: [PEGNode
								newOn: #'mulexpr_times'
								for: string
								from: t1
								to: t4 endPos
								children: t4 nodeList].
			leftRecursionStack removeFirst.
			t3 head isNil
				ifTrue: [(memoization at: t1)
						at: #'parse_mulexpr_times'
						put: t5.
					^ t5].
			(memoization at: t1)
				removeKey: #'parse_mulexpr_times'.
			t3 seed: t5.
			^ self
				answer: #'parse_mulexpr_times'
				withGrowableLeftRecursion: t3
				atPos: t1].
	t2 isLeftRecursion
		ifTrue: [self setup: #'parse_mulexpr_times' withDetectedLeftRecursion: t2.
			^ t2 seed].
	^ t2
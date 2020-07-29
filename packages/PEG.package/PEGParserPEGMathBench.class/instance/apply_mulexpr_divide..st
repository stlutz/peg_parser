as yet unclassified
apply_mulexpr_divide: t1 
	| t2 t3 t4 t5 |
	t2 := self
				recall: #'parse_mulexpr_divide'
				withName: #'mulexpr_divide'
				atPos: t1.
	t2
		ifNil: [t3 := PEGLeftRecursion newWithSeed: nil withRule: #'parse_mulexpr_divide'.
			leftRecursionStack addFirst: t3.
			(memoization at: t1)
				at: #'parse_mulexpr_divide'
				put: t3.
			t4 := self parse_mulexpr_divide: t1.
			t5 := t4
						ifNotNil: [PEGNode
								newOn: #'mulexpr_divide'
								for: string
								from: t1
								to: t4 endPos
								children: t4 nodeList].
			leftRecursionStack removeFirst.
			t3 head isNil
				ifTrue: [(memoization at: t1)
						at: #'parse_mulexpr_divide'
						put: t5.
					^ t5].
			(memoization at: t1)
				removeKey: #'parse_mulexpr_divide'.
			t3 seed: t5.
			^ self
				answer: #'parse_mulexpr_divide'
				withGrowableLeftRecursion: t3
				atPos: t1].
	t2 isLeftRecursion
		ifTrue: [self setup: #'parse_mulexpr_divide' withDetectedLeftRecursion: t2.
			^ t2 seed].
	^ t2
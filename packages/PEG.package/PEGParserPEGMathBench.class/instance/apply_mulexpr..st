as yet unclassified
apply_mulexpr: t1 
	| t2 t3 t4 t5 |
	t2 := self
				recall: #'parse_mulexpr'
				withName: #mulexpr
				atPos: t1.
	t2
		ifNil: [t3 := PEGLeftRecursion newWithSeed: nil withRule: #'parse_mulexpr'.
			leftRecursionStack addFirst: t3.
			(memoization at: t1)
				at: #'parse_mulexpr'
				put: t3.
			t4 := self parse_mulexpr: t1.
			t5 := t4
						ifNotNil: [PEGNode
								newOn: #mulexpr
								for: string
								from: t1
								to: t4 endPos
								children: t4 nodeList].
			leftRecursionStack removeFirst.
			t3 head isNil
				ifTrue: [(memoization at: t1)
						at: #'parse_mulexpr'
						put: t5.
					^ t5].
			(memoization at: t1)
				removeKey: #'parse_mulexpr'.
			t3 seed: t5.
			^ self
				answer: #'parse_mulexpr'
				withGrowableLeftRecursion: t3
				atPos: t1].
	t2 isLeftRecursion
		ifTrue: [self setup: #'parse_mulexpr' withDetectedLeftRecursion: t2.
			^ t2 seed].
	^ t2
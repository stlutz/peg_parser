as yet unclassified
apply_addexpr_minus: t1 
	| t2 t3 t4 t5 |
	t2 := self
				recall: #'parse_addexpr_minus'
				withName: #'addexpr_minus'
				atPos: t1.
	t2
		ifNil: [t3 := PEGLeftRecursion newWithSeed: nil withRule: #'parse_addexpr_minus'.
			leftRecursionStack addFirst: t3.
			(memoization at: t1)
				at: #'parse_addexpr_minus'
				put: t3.
			t4 := self parse_addexpr_minus: t1.
			t5 := t4
						ifNotNil: [PEGNode
								newOn: #'addexpr_minus'
								for: string
								from: t1
								to: t4 endPos
								children: t4 nodeList].
			leftRecursionStack removeFirst.
			t3 head isNil
				ifTrue: [(memoization at: t1)
						at: #'parse_addexpr_minus'
						put: t5.
					^ t5].
			(memoization at: t1)
				removeKey: #'parse_addexpr_minus'.
			t3 seed: t5.
			^ self
				answer: #'parse_addexpr_minus'
				withGrowableLeftRecursion: t3
				atPos: t1].
	t2 isLeftRecursion
		ifTrue: [self setup: #'parse_addexpr_minus' withDetectedLeftRecursion: t2.
			^ t2 seed].
	^ t2
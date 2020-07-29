as yet unclassified
apply_lower: t1 
	| t2 t3 t4 t5 |
	t2 := self
				recall: #'parse_lower'
				withName: #lower
				atPos: t1.
	t2
		ifNil: [t3 := PEGLeftRecursion newWithSeed: nil withRule: #'parse_lower'.
			leftRecursionStack addFirst: t3.
			(memoization at: t1)
				at: #'parse_lower'
				put: t3.
			t4 := self parse_lower: t1.
			t5 := t4
						ifNotNil: [PEGNode
								newOn: #lower
								for: string
								from: t1
								to: t4 endPos
								children: t4 nodeList].
			leftRecursionStack removeFirst.
			t3 head isNil
				ifTrue: [(memoization at: t1)
						at: #'parse_lower'
						put: t5.
					^ t5].
			(memoization at: t1)
				removeKey: #'parse_lower'.
			t3 seed: t5.
			^ self
				answer: #'parse_lower'
				withGrowableLeftRecursion: t3
				atPos: t1].
	t2 isLeftRecursion
		ifTrue: [self setup: #'parse_lower' withDetectedLeftRecursion: t2.
			^ t2 seed].
	^ t2
as yet unclassified
apply_BinaryMessageReceiver: t1 
	| t2 t3 t4 t5 |
	t2 := self
				recall: #'parse_BinaryMessageReceiver'
				withName: #BinaryMessageReceiver
				atPos: t1.
	t2
		ifNil: [t3 := PEGLeftRecursion newWithSeed: nil withRule: #'parse_BinaryMessageReceiver'.
			leftRecursionStack addFirst: t3.
			(memoization at: t1)
				at: #'parse_BinaryMessageReceiver'
				put: t3.
			t4 := self parse_BinaryMessageReceiver: t1.
			t5 := t4
						ifNotNil: [PEGNode
								newOn: #BinaryMessageReceiver
								for: string
								from: t1
								to: t4 endPos
								children: t4 nodeList].
			leftRecursionStack removeFirst.
			t3 head isNil
				ifTrue: [(memoization at: t1)
						at: #'parse_BinaryMessageReceiver'
						put: t5.
					^ t5].
			(memoization at: t1)
				removeKey: #'parse_BinaryMessageReceiver'.
			t3 seed: t5.
			^ self
				answer: #'parse_BinaryMessageReceiver'
				withGrowableLeftRecursion: t3
				atPos: t1].
	t2 isLeftRecursion
		ifTrue: [self setup: #'parse_BinaryMessageReceiver' withDetectedLeftRecursion: t2.
			^ t2 seed].
	^ t2
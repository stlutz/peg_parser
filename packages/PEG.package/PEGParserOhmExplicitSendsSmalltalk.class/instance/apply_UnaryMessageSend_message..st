as yet unclassified
apply_UnaryMessageSend_message: t1 
	| t2 t3 t4 t5 |
	t2 := self
				recall: #'parse_UnaryMessageSend_message'
				withName: #'UnaryMessageSend_message'
				atPos: t1.
	t2
		ifNil: [t3 := PEGLeftRecursion newWithSeed: nil withRule: #'parse_UnaryMessageSend_message'.
			leftRecursionStack addFirst: t3.
			(memoization at: t1)
				at: #'parse_UnaryMessageSend_message'
				put: t3.
			t4 := self parse_UnaryMessageSend_message: t1.
			t5 := t4
						ifNotNil: [PEGNode
								newOn: #'UnaryMessageSend_message'
								for: string
								from: t1
								to: t4 endPos
								children: t4 nodeList].
			leftRecursionStack removeFirst.
			t3 head isNil
				ifTrue: [(memoization at: t1)
						at: #'parse_UnaryMessageSend_message'
						put: t5.
					^ t5].
			(memoization at: t1)
				removeKey: #'parse_UnaryMessageSend_message'.
			t3 seed: t5.
			^ self
				answer: #'parse_UnaryMessageSend_message'
				withGrowableLeftRecursion: t3
				atPos: t1].
	t2 isLeftRecursion
		ifTrue: [self setup: #'parse_UnaryMessageSend_message' withDetectedLeftRecursion: t2.
			^ t2 seed].
	^ t2
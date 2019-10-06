as yet unclassified
answer: ruleName withGrowableLeftRecursion: leftRecursion atPos: pos
	| head |
	head := leftRecursion head.
	^ head ruleName ~~ ruleName
		ifTrue: [leftRecursion seed]
		ifFalse: [
			(memoization at: pos) at: ruleName put: (leftRecursion seed).
			leftRecursion seed
				ifNil: [nil]
				ifNotNil: [self grow: leftRecursion atPos: pos]]
private
answer: ruleMethod withGrowableLeftRecursion: leftRecursion atPos: pos
	| head |
	head := leftRecursion head.
	^ head ruleMethod ~~ ruleMethod
		ifTrue: [leftRecursion seed]
		ifFalse: [
			(memoization at: pos) at: ruleMethod put: (leftRecursion seed).
			leftRecursion seed
				ifNil: [nil]
				ifNotNil: [self grow: leftRecursion atPos: pos]]
as yet unclassified
grow: string withLeftRecursion: leftRecursion atPos: pos
	| result currentResult growing |
	heads at: pos put: leftRecursion head.

	result := leftRecursion seed.
	growing := true.
	[	leftRecursion head evalSet: (IdentitySet newFrom: leftRecursion head involvedSet).
		currentResult := self perform: (leftRecursion ruleName , ':atPos:') asSymbol withArguments: {string . pos}.
		(currentResult == nil or: [currentResult endPos <= result endPos])
			ifTrue: [growing := false]
			ifFalse: [
				result := currentResult.
				(memoization at: pos) at: leftRecursion ruleName put: currentResult]
	] doWhileTrue: [growing].

	heads at: pos put: nil.

	^ result
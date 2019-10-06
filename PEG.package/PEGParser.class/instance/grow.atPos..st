as yet unclassified
grow: leftRecursion atPos: pos
	| result currentResult growing |
	heads at: pos put: leftRecursion head.

	result := leftRecursion seed.
	growing := true.
	[	leftRecursion head evalSet: (IdentitySet newFrom: leftRecursion head involvedSet).
		currentResult := self perform: (leftRecursion ruleName , ':') asSymbol with: pos.
		(currentResult == nil or: [currentResult endPos <= result endPos])
			ifTrue: [growing := false]
			ifFalse: [
				"currentResult cannot be nil here"
				result := PEGNode newOn: #apply from: pos to: currentResult endPos children: currentResult nodeList.
				(memoization at: pos) at: leftRecursion ruleName put: result]
	] doWhileTrue: [growing].

	heads at: pos put: nil.

	^ result
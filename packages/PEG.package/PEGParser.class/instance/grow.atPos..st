private
grow: leftRecursion atPos: pos
	| result currentResult growing selector |
	heads at: pos put: leftRecursion head.
	
	result := leftRecursion seed.
	growing := true.
	selector := leftRecursion ruleMethod asSimpleSetter.
	[	leftRecursion head evalSet: (IdentitySet newFrom: leftRecursion head involvedSet).
		currentResult := self perform: selector with: pos.
		(currentResult isNil or: [currentResult endPos <= result endPos])
			ifTrue: [growing := false]
			ifFalse: [
				"currentResult cannot be nil here"
				result := PEGNode 
					newOn: leftRecursion seed ruleName 
					for: string
					from: pos 
					to: currentResult endPos 
					children: currentResult nodeList.
				(memoization at: pos) at: leftRecursion ruleMethod put: result]
	] doWhileTrue: [growing].

	"We clear the memoization as the results of left-recursive growing should not be memoized.
	This is an optimized version of the approach taken in OhmPositionInfo>>#memoizedResultFor:ifAbsent:
	It assumes that it is cheaper for us to reparse a left-recursive call than to check on every memoization
	whether a memoized result can be used."
	(memoization at: pos) removeKey: leftRecursion ruleMethod.
	leftRecursion head involvedSet do: [:ruleMethodSelector |
		(memoization at: pos) removeKey: ruleMethodSelector ifAbsent: []].
	heads at: pos put: nil.

	^ result
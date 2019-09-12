as yet unclassified
recall: string withRule: ruleName atPos: pos
	| memoizationResult head |
	memoizationResult := (memoization at: pos ifAbsent: [^nil]) at: ruleName ifAbsent: [nil].
	head := heads at: pos.
	
	head ifNil: [^ memoizationResult].
	
	(memoizationResult == nil and: [ruleName ~~ head ruleName] and: [(head involvedSet includes: ruleName) not])
		ifTrue: [^ nil].
	
	(head evalSet includes: ruleName)
		ifTrue: [
			| result |
			head evalSet remove: ruleName.
			result := self perform: (ruleName , ':atPos:') asSymbol withArguments: {string . pos}.
			(memoization at: pos) at: ruleName put: result.
			^ result].
	
	^ memoizationResult
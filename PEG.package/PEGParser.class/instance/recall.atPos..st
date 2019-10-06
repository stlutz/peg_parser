as yet unclassified
recall: ruleName atPos: pos
	| memoizationResult head |
	memoizationResult := (memoization at: pos ifAbsent: [^nil]) at: ruleName ifAbsent: [nil].
	head := heads at: pos.
	
	head ifNil: [^ memoizationResult].
	
	(memoizationResult == nil and: [ruleName ~~ head ruleName] and: [(head involvedSet includes: ruleName) not])
		ifTrue: [^ nil].
	
	(head evalSet includes: ruleName)
		ifTrue: [
			| childResult |
			head evalSet remove: ruleName.
			childResult := self perform: (ruleName , ':') asSymbol with: pos.
			
			^ (memoization at: pos) at: ruleName put: (
				childResult
					ifNil: [nil]
					ifNotNil: [
						PEGNode newOn: #apply from: pos to: childResult endPos children: childResult nodeList ] ) ].
	
	^ memoizationResult
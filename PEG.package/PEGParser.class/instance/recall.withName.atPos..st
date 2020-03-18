private
recall: ruleMethod withName: ruleName atPos: pos
	| memoizationResult head |
	memoizationResult := (memoization at: pos ifAbsent: [^nil]) at: ruleMethod ifAbsent: [nil].
	head := heads at: pos.
	
	head ifNil: [^ memoizationResult].
	
	(memoizationResult == nil and: [ruleMethod ~~ head ruleMethod] and: [(head involvedSet includes: ruleMethod) not])
		ifTrue: [^ nil].
	
	(head evalSet includes: ruleMethod)
		ifTrue: [
			| childResult |
			head evalSet remove: ruleMethod.
			childResult := self perform: (ruleMethod , ':') asSymbol with: pos.
			
			^ (memoization at: pos) at: ruleMethod put: (
				childResult
					ifNil: [nil]
					ifNotNil: [
						PEGNode 
							newOn: ruleName 
							for: string
							from: pos 
							to: childResult endPos 
							children: childResult nodeList ] ) ].
	
	^ memoizationResult
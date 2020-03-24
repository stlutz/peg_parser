private
recall: ruleMethodSelector withName: ruleName atPos: pos
	| memoizationResult head |
	memoizationResult := (memoization at: pos ifAbsent: [^ nil]) 
		at: ruleMethodSelector ifAbsent: [nil].
	head := heads at: pos.
	
	head ifNil: [^ memoizationResult].
	
	(memoizationResult isNil 
		and: [ruleMethodSelector ~~ head ruleMethod] 
		and: [(head isInvolvedRule: ruleMethodSelector) not])
			ifTrue: [^ nil].
	
	(head evalSet includes: ruleMethodSelector)
		ifTrue: [
			| childResult |
			head evalSet remove: ruleMethodSelector.
			childResult := self perform: ruleMethodSelector asSimpleSetter with: pos.
			
			^ childResult
					ifNil: [nil]
					ifNotNil: [
						PEGNode 
							newOn: ruleName 
							for: string
							from: pos 
							to: childResult endPos 
							children: childResult nodeList ]].
	
	^ memoizationResult
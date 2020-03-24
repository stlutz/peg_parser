generating
generateFrom: anOhmGrammarOrProxy
	| converter grammar |
	anOhmGrammarOrProxy isBehavior
		ifTrue: [grammar := anOhmGrammarOrProxy OhmInstance]
		ifFalse: [grammar := anOhmGrammarOrProxy].
		
	converter := self new.
	converter grammar: grammar.
	^ converter generate
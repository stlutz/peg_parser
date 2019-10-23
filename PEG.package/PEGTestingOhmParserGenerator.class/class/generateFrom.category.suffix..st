as yet unclassified
generateFrom: anOhmGrammar category: category suffix: suffix
	| converter |
	converter := self new
		grammar: anOhmGrammar;
		category: category;
		suffix: suffix;
		yourself.
	
	^ converter generate
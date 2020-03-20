as yet unclassified
generateFrom: anOhmGrammar
	| converter |
	converter := self new.
	converter grammar: anOhmGrammar.
	
	^ converter generate
as yet unclassified
new: aRuleDictionary
	| grammar |
	grammar := self new.
	grammar rules addAll: aRuleDictionary.
	^ grammar
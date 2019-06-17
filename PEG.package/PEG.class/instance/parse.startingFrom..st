as yet unclassified
parse: aString startingFrom: anIdentifier
	^ (rules at: anIdentifier) eval: aString at: 1
as yet unclassified
match: aString startingFrom: anIdentifier
	| result |
	result := self parse: aString startingFrom: anIdentifier.
	^ result isNil not
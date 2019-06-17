as yet unclassified
matchWhole: aString startingFrom: anIdentifier
	| result |
	result := self parse: aString startingFrom: anIdentifier.
	^ (result isNil not) and: [result endPos = (aString size + 1)]
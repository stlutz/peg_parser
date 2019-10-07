as yet unclassified
str: aString
	(aString isKindOf: String) ifFalse: [self error: 'String must be a String instance.'].
	
	^ PEGExprString new: aString
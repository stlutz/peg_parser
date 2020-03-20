as yet unclassified
range: aChar
	(aChar isMemberOf: Character) ifFalse: [self error: 'Character must be of class Character.'].
	
	^ PEGExprRange new: aChar
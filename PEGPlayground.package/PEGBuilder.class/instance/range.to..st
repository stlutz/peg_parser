as yet unclassified
range: aStartChar to: anEndChar
	((aStartChar isMemberOf: Character) and: (anEndChar isMemberOf: Character)) ifFalse: [self error: 'Character must be of class Character.'].
	
	^ PEGExprRange new: aStartChar to: anEndChar
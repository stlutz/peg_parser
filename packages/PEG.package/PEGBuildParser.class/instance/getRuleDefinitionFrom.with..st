helper
getRuleDefinitionFrom: parserClass with: ruleName
	parserClass == PEGParser ifTrue: [self error: ruleName , ' is not defined.'].
	^ parserClass ruleDefinitions at: ruleName ifAbsent: [
		self getRuleDefinitionFrom: parserClass superclass with: ruleName]
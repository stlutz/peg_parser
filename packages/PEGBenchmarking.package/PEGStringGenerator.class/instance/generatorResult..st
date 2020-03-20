accessing
generatorResult: generator

	"alternatives"
	(generator isMemberOf: PEGExprAlternativesGenerator) ifTrue: [
		"50% chance to use the last option"
		^ (3 random ~= 1)
			ifTrue: [self generatorResult: generator childGeneratorList last]
			ifFalse: [self generatorResult: (generator childGeneratorList at: (generator childGeneratorList size - 1) random)]].
	
	"sequence"
	(generator isMemberOf: PEGExprLexicalSequenceGenerator) ifTrue: [
		| result |
		result := ''.
		generator childGeneratorList do: [:childGenerator |
			result := result , (self generatorResult: childGenerator)].
		^ result].
	
	"apply"
	(generator isMemberOf: PEGExprLexicalApplyWrapperGenerator) ifTrue: [
		^ self result: generator ruleName].
	
	"zero or more"
	(generator isMemberOf: PEGExprLexicalZeroOrMoreGenerator) ifTrue: [
		| result |
		result := ''.
		[3 random > 1] whileTrue: [
			result := result , (self generatorResult: generator childGenerator)].
		^ result].
	
	"one or more"
	(generator isMemberOf: PEGExprLexicalOneOrMoreGenerator) ifTrue: [
		| result |
		result := self generatorResult: generator childGenerator.
		[3 random > 1] whileTrue: [
			result := result , (self generatorResult: generator childGenerator)].
		^ result].
	
	"string"
	(generator isMemberOf: PEGExprStringGenerator) ifTrue: [
		^ generator literalDict at: #matchString].
	
	"range"
	(generator isMemberOf: PEGExprRangeGenerator) ifTrue: [
		| startChar endChar size |
		startChar := generator literalDict at: #startChar.
		endChar := generator literalDict at: #endChar.
		size := endChar asInteger - startChar asInteger.
		^ (Character value: (startChar asInteger + (size + 1) random - 1)) asString].

	self error: 'Generator ' , generator class printString , ' cannot get handled.'
generating
convertExpr: anOhmExpr isSyntactic: isSyntactic
	| g actions |
	g := generator.
	
	"This actions dictionary mimics a switch case."
	"It ensures we do not forget any cases."
	actions := Dictionary new.
	
	actions at: OhmPExprAlt put: [
		| childGenerators |
		childGenerators := anOhmExpr terms collect: [:childExpr |
			self convertExpr: childExpr isSyntactic: isSyntactic].
		^ g alt: childGenerators].
	
	actions at: OhmPExprApply put: [
		^ isSyntactic
			ifTrue: [g synapply: anOhmExpr ruleName]
			ifFalse: [g lexapply: anOhmExpr ruleName]].

	actions at: OhmPExprLookahead put: [
		^ g and: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].

	actions at: OhmPExprNot put: [
		^ g not: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].

	actions at: OhmPExprMany put: [
		| convertedChildExpr |
		convertedChildExpr := self convertExpr: anOhmExpr term isSyntactic: isSyntactic.

		anOhmExpr min = 0 ifTrue: [
			^ g lexstar: convertedChildExpr].
		anOhmExpr min = 1 ifTrue: [
			^ g lexplus: convertedChildExpr].
		self error: 'Min has to be 0 or 1.'].

	actions at: OhmPExprOpt put: [
		^ g opt: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].
	
	actions at: OhmPExprAnything put: [
		^ isSyntactic 
			ifTrue: [g synany]
			ifFalse: [g any]].

	actions at: OhmPExprRange put: [
		^ isSyntactic
			ifTrue: [g synrange: anOhmExpr startCharacter to: anOhmExpr endCharacter]
			ifFalse: [g range: anOhmExpr startCharacter to: anOhmExpr endCharacter]].
	
	actions at: OhmPExprRegex put: [
		^ isSyntactic
			ifTrue: [g synregex: anOhmExpr regexString]
			ifFalse: [g regex: anOhmExpr regexString]].

	actions at: OhmPExprString put: [
		^ isSyntactic
			ifTrue: [g synstring: anOhmExpr matchString]
			ifFalse: [g string: anOhmExpr matchString]].

	actions at: OhmPExprSeq put: [
		| childGenerators |
		childGenerators := anOhmExpr terms collect: [:childExpr | self convertExpr: childExpr isSyntactic: isSyntactic].
		^g lexseq: childGenerators].
	
	actions at: OhmPExprParam put: [
		self flag: #todo. "Implement the param translation once it it is included in Ohm."
		PEGOhmExprConversionException signal: 'param'].
	
	actions at: OhmPExprCaseInsensitive put: [
		self flag: #todo.
		"Implement the param translation."
		"This requires a new primitive expression generator similar to the string expression generator."
		"Furthermore this new generator needs to considered in the left-recursion detection."
		PEGOhmExprConversionException signal: 'case insensitive'].

	(actions at: anOhmExpr class) value
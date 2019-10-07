as yet unclassified
convertExpr: anOhmExpr isSyntactic: isSyntactic
	| g actions |
	g := generator.
	
	"This actions dictionary mimics a switch case."
	"It ensures we do not verget any cases."
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
			^ isSyntactic
				ifTrue: [^ g synstar: convertedChildExpr]
				ifFalse: [^ g lexstar: convertedChildExpr]].
		anOhmExpr min = 1 ifTrue: [
			^ isSyntactic
				ifTrue: [g synplus: convertedChildExpr]
				ifFalse: [g lexplus: convertedChildExpr]].
		self error: 'Min has to be 0 or 1.'].

	actions at: OhmPExprOpt put: [
		^ g opt: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].
	
	actions at: OhmPExprAnything put: [
		^ g any].

	actions at: OhmPExprRange put: [
		^ g range: anOhmExpr startCharacter to: anOhmExpr endCharacter].

	actions at: OhmPExprString put: [
		^ g str: anOhmExpr matchString].

	actions at: OhmPExprSeq put: [
		| childGenerators |
		childGenerators := anOhmExpr terms collect: [:childExpr | self convertExpr: childExpr isSyntactic: isSyntactic].
		^ isSyntactic
			ifTrue: [g synseq: childGenerators]
			ifFalse: [g lexseq: childGenerators]].
	
	actions at: OhmPExprParam put: [
		self flag: #todo. "Implement the param translation once it it is included in Ohm."
		PEGOhmExprConversionException signal: 'param'
		].
	
	actions at: OhmPExprCaseInsensitive put: [
		self flag: #todo.
		"Implement the param translation."
		"This requires a new primitive expression generator similar to the string expression generator."
		"Furthermore this new generator needs to considered in the left-recursion detection."
		PEGOhmExprConversionException signal: 'case insensitive'].

	(actions at: anOhmExpr class) value
as yet unclassified
convertExpr: anOhmExpr isSyntactic: isSyntactic
	| g actions |
	g := generator.
	
	"actions dict mimics a switch case"
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
				ifTrue: [^ g synplus: convertedChildExpr]
				ifFalse: [^ g lexplus: convertedChildExpr]].
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
			ifTrue: [^ g synseq: childGenerators]
			ifFalse: [^ g lexseq: childGenerators]].
	
	"change these in the future"
	actions at: OhmPExprParam put: [^ g any].
	actions at: OhmPExprCaseInsensitive put: [^ g any].

	(actions at: anOhmExpr class) value
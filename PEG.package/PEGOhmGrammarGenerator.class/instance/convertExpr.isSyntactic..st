as yet unclassified
convertExpr: expr isSyntactic: isSyntactic
 	| b actions |
	b := builder.
	actions := Dictionary new.

	actions at: OhmPExprAlt put: [
		| childExprs |
		childExprs := expr terms collect: [:childExpr |
			self convertExpr: childExpr isSyntactic: isSyntactic].
		^ b alt: childExprs].

	actions at: OhmPExprApply put: [
		isSyntactic
			ifTrue: [^ b seq: {b apply: #spaces . b apply: expr ruleName}]
			ifFalse: [^ b apply: expr ruleName]].

	actions at: OhmPExprLookahead put: [
		^ b and: (self convertExpr: expr term isSyntactic: isSyntactic)].

	actions at: OhmPExprNot put: [
		^ b not: (self convertExpr: expr term isSyntactic: isSyntactic)].

	actions at: OhmPExprMany put: [
		expr min = 0 ifTrue: [^ b star: (self convertExpr: expr term isSyntactic: isSyntactic)].
		expr min = 1 ifTrue: [^ b plus: (self convertExpr: expr term isSyntactic: isSyntactic)].
		self error: 'Min has to be 0 or 1.'].
	
	actions at: OhmPExprOpt put: [
		^ b opt: (self convertExpr: expr term isSyntactic: isSyntactic)].
	
	actions at: OhmPExprAnything put: [
		^ b any].

	actions at: OhmPExprRange put: [
		^ b range: expr startCharacter to: expr endCharacter].

	actions at: OhmPExprString put: [
		^ b str: expr matchString].
	
	actions at: OhmPExprSeq put: [
		| childExprs |
		childExprs := isSyntactic
			ifTrue: [(expr terms collect: [:childExpr | {b apply: #spaces . self convertExpr: childExpr isSyntactic: isSyntactic}]) flatten]
			ifFalse: [expr terms collect: [:childExpr | self convertExpr: childExpr isSyntactic: isSyntactic]].
		^ b seq: childExprs].

	(actions at: (expr class)) value
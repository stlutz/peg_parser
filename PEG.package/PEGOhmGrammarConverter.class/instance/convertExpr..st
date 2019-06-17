as yet unclassified
convertExpr: expr
 	| b actions |
	b := builder.
	actions := Dictionary new.

	actions at: OhmPExprAlt put: [
		| childExprs |
		childExprs := expr terms collect: [:childExpr |
			self convertExpr: childExpr].
		^ b alt: childExprs].

	actions at: OhmPExprApply put: [
		^ b apply: expr ruleName].

	actions at: OhmPExprLookahead put: [
		^ b and: (self convertExpr: expr term)].

	actions at: OhmPExprNot put: [
		^ b not: (self convertExpr: expr term)].

	actions at: OhmPExprMany put: [
		expr min = 0 ifTrue: [^ b star: (self convertExpr: expr term)].
		expr min = 1 ifTrue: [^ b plus: (self convertExpr: expr term)].
		self error: 'Min has to be 0 or 1.'].
	
	actions at: OhmPExprOpt put: [
		^ b opt: (self convertExpr: expr term)].
	
	actions at: OhmPExprAnything put: [
		^ b any].

	actions at: OhmPExprRange put: [
		^ b range: expr startCharacter to: expr endCharacter].

	actions at: OhmPExprString put: [
		^ b str: expr matchString].
	
	actions at: OhmPExprSeq put: [
		| childExprs |
		childExprs := expr terms collect: [:childExpr |
			self convertExpr: childExpr].
		^ b seq: childExprs].

	(actions at: (expr class)) value
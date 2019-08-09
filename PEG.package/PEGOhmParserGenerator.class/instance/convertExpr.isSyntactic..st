as yet unclassified
convertExpr: anOhmExpr isSyntactic: isSyntactic
	| g actions |
	g := generator.
	actions := Dictionary new.

	actions at: OhmPExprAlt put: [
		| childGenerators |
		childGenerators := anOhmExpr terms collect: [:childExpr |
			self convertExpr: childExpr isSyntactic: isSyntactic].
		^ g alt: childGenerators].
	
	actions at: OhmPExprApply put: [
		isSyntactic
			ifTrue: [^ g seq: {g apply: #spaces . g apply: anOhmExpr ruleName}]
			ifFalse: [^ g apply: anOhmExpr ruleName]].

	actions at: OhmPExprLookahead put: [
		^ g and: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].

	actions at: OhmPExprNot put: [
		^ g not: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].

	actions at: OhmPExprMany put: [
		anOhmExpr min == 0 ifTrue: [^ g star: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].
		anOhmExpr min = 1 ifTrue: [^ g plus: (self convertExpr: anOhmExpr term isSyntactic: isSyntactic)].
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
		childGenerators := isSyntactic
			ifTrue: [(anOhmExpr terms collect: [:childExpr | {g apply: #spaces . self convertExpr: childExpr isSyntactic: isSyntactic}]) flatten]
			ifFalse: [anOhmExpr terms collect: [:childExpr | self convertExpr: childExpr isSyntactic: isSyntactic]].
		^ g seq: childGenerators].

	(actions at: anOhmExpr class) value
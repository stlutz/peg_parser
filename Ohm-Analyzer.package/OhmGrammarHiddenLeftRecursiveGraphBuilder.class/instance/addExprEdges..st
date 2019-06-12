as yet unclassified
addExprEdges: expr
	expr class = OhmPExprAlt ifTrue: [
		expr terms do: [:term |
			term := self addExpr: term.
			graph addEdgeFrom: expr to: term]].

	expr class = OhmPExprSeq ifTrue: [
		| lastTermCanParseEpsilon termsStream |
		lastTermCanParseEpsilon := true.
		termsStream := expr terms readStream.
		
		[lastTermCanParseEpsilon and: [termsStream atEnd not]]
			whileTrue: [
				| term state |
				term := self addExpr: (termsStream next).
				graph addEdgeFrom: expr to: term.
				
				"Create new state to check if it can parse empty string."
				state := OhmParsingState new.
				state
					grammar: grammar;
					pushInput: (OhmInputStream on: '');
					isSyntactic: false;
					pushBindings: OrderedCollection new;
					shouldRecordFailures: false.
				lastTermCanParseEpsilon := term eval: state]].

	((expr class = OhmPExprLookahead) or:
	[expr class = OhmPExprNot] or:
	[expr class = OhmPExprMany] or:
	[expr class = OhmPExprOpt]) ifTrue: [
		| term |
		term := self addExpr: (expr term).
		graph addEdgeFrom: expr to: term].
as yet unclassified
findLeftRecursiveIdentifiers: parserClass
	| reduceGraph graph queue addParsesEpsilon getRuleDefinition addExprWithName reduceGraphComponents |
	
	reduceGraph := parserClass derivationGraph copy.
	queue := LinkedList new.
	
	reduceGraph nodes do: [:expr |
		reduceGraph nodeData: expr at: #parsesEpsilon put: false.
		queue add: expr].
	
	addParsesEpsilon := [:expr |
		reduceGraph nodeData: expr at: #parsesEpsilon put: true.
		queue addAll: (reduceGraph predecessors: expr)].
	
	[queue isEmpty] whileFalse: [
		| expr |
		expr := queue removeFirst.
		(reduceGraph nodeData: expr at: #parsesEpsilon) ifFalse: [
			(expr isMemberOf: OhmPExprAlt) ifTrue: [
				((reduceGraph successors: expr) anySatisfy: [:succ |
					reduceGraph nodeData: succ at: #parsesEpsilon]) ifTrue: [
						addParsesEpsilon value: expr]].
			(expr isMemberOf: OhmPExprApply) ifTrue: [
				(reduceGraph nodeData: ((reduceGraph successors: expr) at: 1) at: #parsesEpsilon) ifTrue: [
					addParsesEpsilon value: expr]].
			((expr isKindOf: OhmPExprLookahead) or: [expr isMemberOf: OhmPExprOpt]) ifTrue: [
				addParsesEpsilon value: expr].
			(expr isMemberOf: OhmPExprMany) ifTrue: [
				((expr min == 0) or: [(reduceGraph successors: expr) anySatisfy: [:succ |
					reduceGraph nodeData: succ at: #parsesEpsilon]]) ifTrue: [
						addParsesEpsilon value: expr]].
			((expr isMemberOf: OhmPExprCaseInsensitive) or: [expr isMemberOf: OhmPExprString]) ifTrue: [
				(expr matchString size == 0) ifTrue: [
					addParsesEpsilon value: expr]].
			(expr isMemberOf: OhmPExprSeq) ifTrue: [
				((reduceGraph successors: expr) allSatisfy: [:succ |
					reduceGraph nodeData: succ at: #parsesEpsilon]) ifTrue: [
						addParsesEpsilon value: expr]]]].
	
	
	graph := DirectedGraph new.
	
	getRuleDefinition := [:ruleName |
		| currentClass expr |
		"Iterate through classes to get rule definition"
		currentClass := parserClass.
		[expr == nil] whileTrue: [
			currentClass == PEGParser ifTrue: [self error: ruleName , ' is not defined.'].
			expr := currentClass ruleDefinitions at: ruleName ifAbsent: [nil].
			currentClass := currentClass superclass].
		expr].
	
	addExprWithName := [:expr :name |
		(graph includes: expr) ifFalse: [
			graph addNode: expr.
			graph nodeData: expr at: #name put: name.
			
			"Apply"
			(expr isKindOf: PEGExprLexicalApplyWrapperGenerator) ifTrue: [
				| childExpr |
				childExpr := addExprWithName value: (getRuleDefinition value: expr ruleName) value: expr ruleName.
				graph addEdgeFrom: expr to: childExpr].
			
			"Alternatives"
			(expr isKindOf: PEGExprAlternativesGenerator) ifTrue: [
				expr childGeneratorList do: [:childExpr |
					addExprWithName value: childExpr value: nil.
					graph addEdgeFrom: expr to: childExpr]].
			
			"Sequence"
			((expr isKindOf: PEGExprLexicalSequenceGenerator) or:
			[expr isKindOf: PEGExprSyntacticalSequenceGenerator]) ifTrue: [
				| lastCanParseEpsilon stream |
				lastCanParseEpsilon := true.
				stream := expr childGeneratorList readStream.
				
				[lastCanParseEpsilon and: [stream atEnd not]]
					whileTrue: [
						| term |
						term := addExprWithName value: (stream next) value: nil.
						graph addEdgeFrom: expr to: term.
						
						lastCanParseEpsilon := reduceGraph nodeData: term at: #parsesEpsilon]].
			
			"Lookahead Not ZeroOrMore OneOrMore Opt"
			(expr isKindOf: PEGExprWrapperGenerator) ifTrue: [
				addExprWithName value: expr childGenerator value: nil.
				graph addEdgeFrom: expr to: expr childGenerator]
		].
	"return expr"
	expr
	].
	
	reduceGraph nodes do: [:expr |
		addExprWithName value: expr value: (reduceGraph nodeData: expr at: #name)].
	
	parserClass leftRecursiveIdentifiers: IdentitySet new.
	parserClass nonLeftRecursiveIdentifiers: IdentitySet new.
	
	reduceGraphComponents := (FindComponents new: graph) result.
	
	(reduceGraphComponents select: [:set | set size > 1])
	do: [:set |
		(set select: [:expr | expr isKindOf: PEGExprLexicalApplyWrapperGenerator])
		do: [:expr | parserClass leftRecursiveIdentifiers add: expr ruleName]].
	
	(reduceGraphComponents select: [:set | set size = 1])
	do: [:set |
		(set select: [:expr | expr isKindOf: PEGExprLexicalApplyWrapperGenerator])
		do: [:expr | parserClass nonLeftRecursiveIdentifiers add: expr ruleName]]
rule identifiers
extractRuleIdentifiers
	| connectedComponents |
	
	connectedComponents := (FindComponents new: leftRecursionGraph) result.
	
	parserClass leftRecursiveIdentifiers: IdentitySet new.
	parserClass nonLeftRecursiveIdentifiers: IdentitySet new.
	
	(connectedComponents select: [:set | set size > 1])
	do: [:set |
		(set select: [:expr | expr isKindOf: PEGExprLexicalApplyWrapperGenerator]) "SyntacticalApplyWrapperGenerator inherits"
		do: [:expr | parserClass leftRecursiveIdentifiers add: expr ruleName]].
	
	(connectedComponents select: [:set | set size = 1])
	do: [:set |
		(set select: [:expr | expr isKindOf: PEGExprLexicalApplyWrapperGenerator]) "SyntacticalApplyWrapperGenerator inherits"
		do: [:expr |
			(parserClass leftRecursiveIdentifiers includes: expr ruleName) ifFalse:
				[parserClass nonLeftRecursiveIdentifiers add: expr ruleName]]]

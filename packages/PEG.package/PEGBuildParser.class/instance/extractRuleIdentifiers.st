rule identifiers
extractRuleIdentifiers
	| connectedComponents |
	
	connectedComponents := (FindComponents new: leftRecursionGraph) result.
	
	parserClass leftRecursiveIdentifiers: IdentitySet new.
	parserClass nonLeftRecursiveIdentifiers: IdentitySet new.
	
	(connectedComponents select: [:set | set size > 1])
	do: [:set |
		(set collect: [:expr | leftRecursionGraph nodeData: expr at: #name])
		do: [:identifier |
			identifier ifNotNil: [parserClass leftRecursiveIdentifiers add: identifier]]].
	
	(connectedComponents select: [:set | set size = 1])
	do: [:set |
		(set collect: [:expr | leftRecursionGraph nodeData: expr at: #name])
		do: [:identifier |
			identifier ifNotNil: [
				(parserClass leftRecursiveIdentifiers includes: identifier) ifFalse: [
					parserClass nonLeftRecursiveIdentifiers add: identifier]]]]
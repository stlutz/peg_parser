method body generation
methodBodyTemplate
	^ '^ (memoization at: pos ifAbsent: [^ nil]) at: #{1} ifAbsentPut: [
		| childResult |
		childResult := self {1}: pos.
		childResult
			ifNil: [nil]
			ifNotNil: [
				PEGNode newOn: #{2} for: string from: pos to: childResult endPos children: childResult nodeList ] ]'
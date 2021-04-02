method body generation
methodBodyTemplateWith: childCount
	^ String streamContents: [:stream |
		| resultNames |
		resultNames := (1 to: childCount) collect: [:index |
			'res{1}' format: { index asString }].
		
		stream nextPutAll: '| children childrenIndex '.
		resultNames do: [:resultName |
			stream nextPutAll: resultName; space].
		stream nextPutAll: '|'; lf.
		
		stream nextPutAll: ('({1} := self \{1\}: pos) ifNil: [^ nil].' format: { resultNames first }).
		2 to: childCount do: [:index |
			stream
				nextPutAll: ('({2} := self \{{1}\}: {3} endPos) ifNil: [^ nil].'
								format: {
									index asString .
									resultNames at: index .
									resultNames at: index - 1 }); lf].
		
		stream nextPutAll: 'children := Array new: ('.
		resultNames
			do: [:resultName | stream nextPutAll: ('{1} nodeListSize' format: { resultName })]
			separatedBy: [stream nextPutAll: ' + '].
		stream
			nextPutAll: ').'; lf;
			nextPutAll: 'childrenIndex := 0.'; lf.
		
		resultNames do: [:resultName |
			stream
				nextPutAll: resultName;
				nextPutAll: (' nodeList do: [:child | children at: (childrenIndex := childrenIndex + 1) put: child].'); lf].
		
		stream nextPutAll: ('^ PEGShadowNode
								newOn: #shadow
								for: string
								from: pos
								to: {1} endPos
								children: children' format: { resultNames last })]
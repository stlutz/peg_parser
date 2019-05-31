as yet unclassified
parse: string
	^ [parser parse: string class: Object]
		on: SyntaxErrorNotification
		do: [:sig | sig return: nil]
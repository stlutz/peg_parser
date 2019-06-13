as yet unclassified
matchWhole: string
	| result |
	result := self eval: string at: 1.
	^ result = (string size + 1)
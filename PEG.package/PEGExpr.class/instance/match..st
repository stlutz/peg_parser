as yet unclassified
match: string
	| result |
	result := self eval: string at: 1.
	^ result > 0
as yet unclassified
edgeWeightFrom: u to: v
	| edgeData |
	edgeData := self edgeDataFrom: u to: v.
	^ edgeData at: #weight ifAbsent: 1.
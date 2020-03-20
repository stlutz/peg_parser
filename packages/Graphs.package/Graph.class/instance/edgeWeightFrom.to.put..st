as yet unclassified
edgeWeightFrom: u to: v put: weight
	| edgeData |
	edgeData := self edgeDataFrom: u to: v.
	^ edgeData at: #weight put: weight.
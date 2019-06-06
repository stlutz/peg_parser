as yet unclassified
addAdj: aGraphNode data: aDataDictionary	
	| edge |
	edge := adj at: aGraphNode ifAbsentPut: [Edge newFrom: self to: aGraphNode data: aDataDictionary].
	edge data addAll: aDataDictionary.

as yet unclassified
addPred: aGraphNode data: aDataDictionary
	| edge |
	edge := succ at: aGraphNode ifAbsentPut: [Edge newFrom: aGraphNode to: self data: aDataDictionary].
	edge data addAll: aDataDictionary
as yet unclassified
addPred: aGraphNode data: aDataDictionary
	| edge |
	edge := pred at: aGraphNode ifAbsentPut: [Edge newFrom: aGraphNode to: self data: aDataDictionary].
	edge data addAll: aDataDictionary
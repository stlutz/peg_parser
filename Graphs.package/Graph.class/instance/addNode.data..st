as yet unclassified
addNode: n data: aDataDictionary
	| node |
	node := self addNode: n.
	node data addAll: data.
	^ node
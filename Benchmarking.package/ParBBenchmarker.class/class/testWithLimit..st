as yet unclassified
testWithLimit: limit
	| benchmarkerInstances resultsList |
	resultsList := LinkedList new.
	
	benchmarkerInstances := ParBBenchmarker subclasses collect: [:cls | cls new].
	benchmarkerInstances do: [:benchmarker |
		resultsList add: (self testWithBenchmarker: benchmarker limit: limit)
		] displayingProgress: [:benchmarker | benchmarker class asString].
	
	^resultsList.
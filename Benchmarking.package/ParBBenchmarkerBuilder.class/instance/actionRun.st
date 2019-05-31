as yet unclassified
actionRun
	results := ParBBenchmarker testWithBenchmarker: benchmarker limit: 5.
	self changed: #results.
	self changed: #selectedResult.
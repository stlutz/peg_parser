build
buildWithBuilder: aBuilder benchmarker: aBenchmarker

	| windowSpec |
	benchmarker := aBenchmarker.
	
	windowSpec := aBuilder pluggableWindowSpec new
		label: benchmarker className;
		children: {
			self buildLimitInputFieldWith: aBuilder .
			self buildRunButtonWith: aBuilder .
			self buildResultListWith: aBuilder
		}.
		
	^ aBuilder build: windowSpec
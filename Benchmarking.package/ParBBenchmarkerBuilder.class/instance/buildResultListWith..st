build
buildResultListWith: aBuilder
	^ aBuilder pluggableListSpec new
		frame: (0@0.05 corner: 0.5@0.65);
		model: self;
		list: #results;
		getSelected: #selectedResult;
		setSelected: #selectedResult:;
		yourself.
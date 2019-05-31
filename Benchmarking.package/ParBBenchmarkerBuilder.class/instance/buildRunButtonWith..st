build
buildRunButtonWith: aBuilder
	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Run';
		frame: (0.5@0 corner: 1@0.05);
		action: #actionRun;
		yourself.
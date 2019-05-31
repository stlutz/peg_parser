build
buildLimitInputFieldWith: aBuilder
	^ aBuilder pluggableInputFieldSpec new
		frame: (0@0 corner: 0.5@0.05);
		yourself.
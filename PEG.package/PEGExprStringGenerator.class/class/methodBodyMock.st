as yet unclassified
methodBodyMock
	^ '#matchString withIndexDo: [:character :index |
		(character == (string at: (pos + index - 1) ifAbsent: [nil])) ifFalse: [
			self reportFailureOf: #matchString atPos: pos.
			^ nil] ].
	^ PEGNode newOn: #_terminal for: string from: pos to: (pos + #matchString size)'
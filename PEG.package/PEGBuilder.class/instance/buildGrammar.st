as yet unclassified
buildGrammar
	rules valuesDo: [:expr |
		self fillApplyExprs: expr].
	^ PEG new: rules
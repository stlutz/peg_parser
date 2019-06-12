as yet unclassified
canParseEpsilon: expr
	| state |
	state := OhmParsingState new.
	state
		grammar: grammar;
		pushInput: (OhmInputStream on: '');
		isSyntactic: false;
		pushBindings: OrderedCollection new;
		shouldRecordFailures: false.
	^ expr eval: state
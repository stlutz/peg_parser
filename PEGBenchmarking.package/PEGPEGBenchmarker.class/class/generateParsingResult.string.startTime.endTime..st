as yet unclassified
generateParsingResult: result string: aString startTime: timestamp1 endTime: timestamp2
	^ PEGBenchmarkerParsingResult createWithInput: aString result: result success: result isNil not time: (timestamp1 to: timestamp2) asDuration asMilliSeconds.
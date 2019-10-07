as yet unclassified
generateParsingResult: result string: aString time: aTime
	^ PEGBenchmarkerParsingResult createWithInput: aString result: result success: (result succeeded) time: aTime.
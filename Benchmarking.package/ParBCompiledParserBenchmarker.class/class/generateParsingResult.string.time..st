as yet unclassified
generateParsingResult: result string: aString time: aTime
	^ ParBParsingResult createWithInput: aString result: result success: result isNil not time: aTime.
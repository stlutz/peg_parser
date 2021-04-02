printing
printOn: aStream

	aStream
		nextPutAll: ruleName asString;
		nextPutAll: ' [';
		nextPutAll: startPos asString;
		nextPutAll: '-';
		nextPutAll: endPos asString;
		nextPutAll: ']'
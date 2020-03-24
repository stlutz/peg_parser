instance creation
newOn: ruleName for: string from: startPos to: endPos

	^ self new
		contents: string;
		ruleName: ruleName;
		startPos: startPos;
		endPos: endPos;
		yourself
instance creation
newOn: ruleName for: contents from: startPos to: endPos children: children

	^ self basicNew
		initializeWithRuleName: ruleName
		contents: contents
		startPos: startPos
		endPos: endPos
		children: children
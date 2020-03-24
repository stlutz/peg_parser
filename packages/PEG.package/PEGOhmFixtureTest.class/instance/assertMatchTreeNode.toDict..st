assertions
assertMatchTreeNode: node toDict: dict
	self assert: dict ruleName equals: node ruleName.
	dict children ifNotNil: [
		self assert: dict children size equals: node children size.
	
		node children with: dict children do: [:childNode :childDict |
			childDict ifNotNil: [
				childDict isDictionary
					ifFalse: [self assert: childNode = childDict]
					ifTrue: [self assertMatchTreeNode: childNode toDict: childDict]]]]
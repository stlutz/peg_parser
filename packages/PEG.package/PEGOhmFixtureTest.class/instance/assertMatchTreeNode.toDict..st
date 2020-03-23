assertions
assertMatchTreeNode: node toDict: dict
	self assert: dict  ruleName equals: node ruleName.
	node children ifNotNil: [
		self assert: dict children size equals: node children size.
	
		node children with: dict children do: [:childNode :childDict |
			childDict
				ifNil: [self assert: childNode isNil]
				ifNotNil: [self assertMatchTreeNode: childNode toDict: childDict]]]
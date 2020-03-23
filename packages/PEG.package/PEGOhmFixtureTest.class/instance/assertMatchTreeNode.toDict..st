assertions
assertMatchTreeNode: node toDict: dict
	self assert: node ruleName equals: (dict at: 'ruleName').
	node children ifNotNil: [
		self assert: node children size equals: (dict at: 'children') size.
	
		node children with: (dict at: 'children') do: [:childNode :childDict |
			childDict
				ifNil: [self assert: childNode isNil]
				ifNotNil: [self assertMatchTreeNode: childNode toDict: childDict]]]
as yet unclassified
test1
	| expr string result childResult |
	expr := PEGExprOptional new: (PEGExprString new: 'abc').
	string := 'abc...abcab'.

	result := expr eval: string at: 1.
	self assert: result startPos equals: 1.
	self assert: result endPos equals: 4.
	self assert: result children size equals: 1.
	self assert: result identifier equals: nil.
	childResult := result children at: 1.
	self assert: childResult startPos equals: 1.
	self assert: childResult endPos equals: 4.
	self assert: childResult children equals: nil.
	self assert: childResult identifier equals: nil.

	result := expr eval: string at: 2.
	self assert: result startPos equals: 2.
	self assert: result endPos equals: 2.
	self assert: result children size equals: 0.
	self assert: result identifier equals: nil.

	result := expr eval: string at: 7.
	self assert: result startPos equals: 7.
	self assert: result endPos equals: 10.
	self assert: result children size equals: 1.
	self assert: result identifier equals: nil.

	result := expr eval: string at: 10.
	self assert: result startPos equals: 10.
	self assert: result endPos equals: 10.
	self assert: result children size equals: 0.
	self assert: result identifier equals: nil.
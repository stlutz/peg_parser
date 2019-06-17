as yet unclassified
test1
	| expr string result |
	expr := PEGExprNot new: (PEGExprString new: 'abc').
	string := 'abc...abcab'.

	result := expr eval: string at: 1.
	self assert: result equals: nil.
	
	result := expr eval: string at: 2.
	self assert: result startPos equals: 2.
	self assert: result endPos equals: 2.
	self assert: result children equals: nil.
	self assert: result identifier equals: nil.

	result := expr eval: string at: 7.
	self assert: result equals: nil.
	
	result := expr eval: string at: 20.
	self assert: result startPos equals: 20.
	self assert: result endPos equals: 20.
	self assert: result children equals: nil.
	self assert: result identifier equals: nil.
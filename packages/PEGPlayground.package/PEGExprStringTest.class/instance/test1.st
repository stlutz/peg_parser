as yet unclassified
test1
	| expr string result |
	expr := PEGExprString new: 'abc'.
	string := 'abc...abcab'.

	result := expr eval: string at: 1.
	self assert: result startPos equals: 1.
	self assert: result endPos equals: 4.
	self assert: result children equals: nil.
	self assert: result identifier equals: nil.

	result := expr eval: string at: 2.
	self assert: result equals: nil.

	result := expr eval: string at: 7.
	self assert: result startPos equals: 7.
	self assert: result endPos equals: 10.
	self assert: result children equals: nil.
	self assert: result identifier equals: nil.

	result := expr eval: string at: 10.
	self assert: result equals: nil.
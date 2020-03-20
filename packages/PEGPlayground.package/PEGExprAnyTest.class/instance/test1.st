as yet unclassified
test1
	| expr string result |
	expr := PEGExprAny new.
	string := '123456789'.

	result := expr eval: string at: 1.
	self assert: result startPos equals: 1.
	self assert: result endPos equals: 2.
	self assert: result children equals: nil.
	self assert: result identifier equals: nil.

	result := expr eval: string at: 5.
	self assert: result startPos equals: 5.
	self assert: result endPos equals: 6.
	self assert: result children equals: nil.
	self assert: result identifier equals: nil.
	
	result := expr eval: string at: 10.
	self assert: result equals: nil.
	
	result := expr eval: string at: 11.
	self assert: result equals: nil.
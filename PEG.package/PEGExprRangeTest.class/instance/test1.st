as yet unclassified
test1
	| expr string result |
	expr := PEGExprRange new: $a to: $f.
	string := 'abc...defzzz'.
	
	result := expr eval: string at: 1.
	self assert: result startPos equals: 1.
	self assert: result endPos equals: 2.
	self assert: result children equals: nil.
	self assert: result identifier equals: nil.
	
	result := expr eval: string at: 2.
	self assert: (result ~~ nil).
	
	result := expr eval: string at: 3.
	self assert: (result ~~ nil).
	
	result := expr eval: string at: 4.
	self assert: result equals: nil.
	
	result := expr eval: string at: 7.
	self assert: (result ~~ nil).
	
	result := expr eval: string at: 8.
	self assert: (result ~~ nil).
	
	result := expr eval: string at: 9.
	self assert: (result ~~ nil).

	result := expr eval: string at: 10.
	self assert: result equals: nil.
	
	result := expr eval: string at: 20.
	self assert: result equals: nil.

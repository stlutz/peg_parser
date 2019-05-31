as yet unclassified
testWithBenchmarker: aBenchmarker limit: aLimit
	| classes results |
	
	aLimit = -1 ifTrue: [
		classes := Smalltalk allClasses copy.
	] ifFalse: [
		classes := Smalltalk allClasses copyFrom: 1 to: aLimit.
	].
	
	results := LinkedList new.
	classes do: [:cls |
			(cls methodDict keys collect: [:key |
				(cls sourceCodeAt: key) asString
			]) do: [:methodString |
				results add: (aBenchmarker run: methodString).
			]
	] displayingProgress: [:cls | cls name asString].
	
	^results.

as yet unclassified
setup: ruleName withDetectedLeftRecursion: leftRecursion
	| leftRecursionStackLink |
	leftRecursion head ifNil: [leftRecursion head: (PEGLeftRecursionHead newWithRule: ruleName)].
	leftRecursionStackLink := leftRecursionStack firstLink.
	[leftRecursionStackLink value head ~~ leftRecursion head]
		whileTrue: [
			leftRecursionStackLink value head: leftRecursion head.
			leftRecursion head involvedSet add: leftRecursionStackLink value ruleName.
			leftRecursionStackLink := leftRecursionStackLink nextLink]
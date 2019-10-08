private
setup: ruleMethod withDetectedLeftRecursion: leftRecursion
	| leftRecursionStackLink |
	leftRecursion head ifNil: [leftRecursion head: (PEGLeftRecursionHead newWithRule: ruleMethod)].
	leftRecursionStackLink := leftRecursionStack firstLink.
	[leftRecursionStackLink value head ~~ leftRecursion head]
		whileTrue: [
			leftRecursionStackLink value head: leftRecursion head.
			leftRecursion head involvedSet add: leftRecursionStackLink value ruleMethod.
			leftRecursionStackLink := leftRecursionStackLink nextLink]
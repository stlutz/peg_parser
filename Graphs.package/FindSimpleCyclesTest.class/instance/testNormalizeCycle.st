as yet unclassified
testNormalizeCycle
	| findSimpleCycles cycle normalizedCycle |
	findSimpleCycles := FindSimpleCycles new.

	cycle := {1 . 2 . 3 . 4 . 5}.
	normalizedCycle := findSimpleCycles normalizeCycle: cycle.
	self assert: cycle = normalizedCycle.

	cycle := {2 . 6 . 9 . 1 . 5 . 0 . 3}.
	normalizedCycle := findSimpleCycles normalizeCycle: cycle.
	self assert: normalizedCycle = {0 . 3 . 2 . 6 . 9 . 1 . 5}.

	cycle := {4 . 8 . 1 . 9 . 4 . 5}.
	normalizedCycle := findSimpleCycles normalizeCycle: cycle.
	self assert: normalizedCycle = {1 . 9 . 4 . 5 . 4 . 8}.

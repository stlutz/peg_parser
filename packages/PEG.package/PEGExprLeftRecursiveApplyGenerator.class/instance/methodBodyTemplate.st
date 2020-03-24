method body generation
methodBodyTemplate

	^ '| recallResult leftRecursion childResult result |
	"The ordinary case is hidden in this call"
	recallResult := self recall: #{1} withName: #{2} atPos: pos.

	recallResult
		ifNil: [
			leftRecursion := PEGLeftRecursion newWithSeed: nil withRule: #{1}.
			leftRecursionStack addFirst: leftRecursion.
			(memoization at: pos) at: #{1} put: leftRecursion.
			childResult := self {1}: pos.
			result := childResult
				ifNil: [nil]
				ifNotNil: [
					PEGNode newOn: #{2} for: string from: pos to: childResult endPos children: childResult nodeList].
			leftRecursionStack removeFirst.
			
			leftRecursion head
				ifNil: [
					(memoization at: pos) at: #{1} put: result.
					^ result]
				ifNotNil: [
					(memoization at: pos) removeKey: #{1}. "No need for my own left recursion anymore"
					leftRecursion seed: result.
					^ self answer: #{1} withGrowableLeftRecursion: leftRecursion atPos: pos] ]
		ifNotNil: [
			recallResult isLeftRecursion
				ifTrue: [
					self setup: #{1} withDetectedLeftRecursion: recallResult.
					^ recallResult seed]
				ifFalse: [
					^ recallResult]]'
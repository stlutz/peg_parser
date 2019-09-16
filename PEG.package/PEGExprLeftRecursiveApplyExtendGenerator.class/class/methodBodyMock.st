as yet unclassified
methodBodyMock
	^ '| recallResult leftRecursion result |
	recallResult := self recall: string withRule: #{1} atPos: pos.
	recallResult
		ifNil: [
			leftRecursion := PEGLeftRecursion newWithSeed: nil withRule: #{1}.
			leftRecursionStack addFirst: leftRecursion.
			(memoization at: pos) at: #{1} put: leftRecursion.
			result := self {1}: string atPos: pos.
			result := result ifNil: [super {1}: string atPos: pos].
			leftRecursionStack removeFirst.
			
			leftRecursion head
				ifNil: [
					(memoization at: pos) at: #{1} put: result.
					^ result]
				ifNotNil: [
					leftRecursion seed: result.
					^ self answer: string withRule: #{1} withGrowableLeftRecursion: leftRecursion atPos: pos] ]
		ifNotNil: [
			(recallResult isMemberOf: PEGLeftRecursion)
				ifTrue: [
					self setup: #{1} withDetectedLeftRecursion: recallResult.
					^ recallResult seed]
				ifFalse: [^ recallResult] ]'

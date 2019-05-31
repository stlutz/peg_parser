as yet unclassified
analyze
	"Returns a List containing Quintuples of the format (messageIdentifier , tallySum , calls , tallyAverage , tallyShare)"
	| singleResults queue results |
	
	messageTally ifNil: [self run].
	
	singleResults := Dictionary new.

	queue := LinkedList new.
	queue add: messageTally.

	[queue isEmpty not] whileTrue: [
		| current childTallySum currentResultList |
		current := queue first.
		queue removeFirst.

		childTallySum := 0.
		(current sonsOver: 0) do: [:childTally |
			queue add: childTally.
			childTallySum := childTallySum + (childTally tally).
			].
	currentResultList := singleResults at: (current name) ifAbsentPut: [LinkedList new.].
	currentResultList add: (current tally - childTallySum).
	].

	results := LinkedList new.
	singleResults keys do: [:key |
		| sum size avg agg share |
		sum := (singleResults at: key) sum.
		size := (singleResults at: key) size.
		avg := size isZero ifTrue: 0 ifFalse: [sum / size asFloat].
		share := sum / (messageTally tally) asFloat.
		agg := Quintuple a: key b: sum c: size d: avg e: share.
		results add: agg.
	].

	^ results asArray.

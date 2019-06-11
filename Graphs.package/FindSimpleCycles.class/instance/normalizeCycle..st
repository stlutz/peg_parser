as yet unclassified
normalizeCycle: cycle
	"Rearanges the cycle such that it starts with the smallest node."
	| min minPos currPos normalizedCycle currLink |
	min := cycle first.
	minPos := 1.
	currPos := 0.
	
	cycle do: [:elem |
		currPos := currPos + 1.
		elem < min ifTrue: [
			min := elem.
			minPos := currPos]].
	
	minPos = 1 ifTrue: [^ cycle asArray].
	
	currPos := 0.
	normalizedCycle := LinkedList new.
	cycle do: [:elem |
		currPos :=  currPos + 1.
		currPos < minPos
			ifTrue: [normalizedCycle add: elem]
			ifFalse: [
				currLink = nil
					ifTrue: [
						normalizedCycle addFirst: elem.
						currLink := normalizedCycle firstLink]
					ifFalse: [currLink := normalizedCycle add: elem afterLink: currLink]]].

	^ normalizedCycle asArray

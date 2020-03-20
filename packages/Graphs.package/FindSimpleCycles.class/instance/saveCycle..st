as yet unclassified
saveCycle: n
	| cycle currentLink currentNode |
	cycle := LinkedList new.
	currentLink := stack firstLink.
	currentNode := currentLink value.
	[currentNode = n] whileFalse: [
		cycle addFirst: currentNode.
		currentLink := currentLink nextLink.
		currentNode := currentLink value].
	cycle addFirst: currentNode.
	result add: (self normalizeCycle: cycle).
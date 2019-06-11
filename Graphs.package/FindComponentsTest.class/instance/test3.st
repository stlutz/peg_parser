as yet unclassified
test3
	"
	Graph:
	1 -> 2
	2 -> 3, 4
	3 -> 2, 5
	4 -> 1, 3
	5 -> 6
	6 -> 7
	7 -> 8
	8 -> 5, 6
	"

	| graph result component1 component2 |
	graph := DirectedGraph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 2 to: 4.
	graph addEdgeFrom: 3 to: 2.
	graph addEdgeFrom: 3 to: 5.
	graph addEdgeFrom: 4 to: 1.
	graph addEdgeFrom: 4 to: 3.
	graph addEdgeFrom: 5 to: 6.
	graph addEdgeFrom: 6 to: 7.
	graph addEdgeFrom: 7 to: 8.
	graph addEdgeFrom: 8 to: 5.
	graph addEdgeFrom: 8 to: 6.	
	result := (FindComponents new: graph) result.
	
	component1 := Set new.
	component1 add: 1.
	component1 add: 2.
	component1 add: 3.
	component1 add: 4.
	
	component2 := Set new.
	component2 add: 5.
	component2 add: 6.
	component2 add: 7.
	component2 add: 8.
	
	self assert: (result includes: component1).
	self assert: (result includes: component2).

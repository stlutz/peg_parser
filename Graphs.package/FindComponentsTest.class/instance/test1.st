as yet unclassified
test1
	"
	Graph:
	1 -> 2, 5
	2 -> 3 -> 4 -> 2
	5 -> 6 -> 7 -> 5
	"

	| graph result component1 component2 component3 |
	graph := DirectedGraph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 3 to: 4.
	graph addEdgeFrom: 4 to: 2.

	graph addEdgeFrom: 1 to: 5.
	graph addEdgeFrom: 5 to: 6.
	graph addEdgeFrom: 6 to: 7.
	graph addEdgeFrom: 7 to: 5.
	
	result := (FindComponents new: graph) result.
	
	component1 := Set new.
	component1 add: 1.
	
	component2 := Set new.
	component2 add: 2.
	component2 add: 3.
	component2 add: 4.
	
	component3 := Set new.
	component3 add: 5.
	component3 add: 6.
	component3 add: 7.

	self assert: (result includes: component1).
	self assert: (result includes: component2).
	self assert: (result includes: component3).

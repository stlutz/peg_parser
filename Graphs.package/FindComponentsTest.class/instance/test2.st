as yet unclassified
test2
	"
	Graph:
	1 -> 2 -> 3 -> 6 -> 4 -> 5 -> 6
	1 ->3
	"

	| graph result component1 component2 component3 component4 |
	graph := DirectedGraph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 3 to: 6.
	graph addEdgeFrom: 6 to: 4.
	graph addEdgeFrom: 4 to: 5.
	graph addEdgeFrom: 5 to: 6.
	graph addEdgeFrom: 1 to: 3.
		
	result := (FindComponents new: graph) result.
	
	component1 := Set new.
	component1 add: 1.
	
	component2 := Set new.
	component2 add: 2.
	
	component3 := Set new.
	component3 add: 3.
	
	component4 := Set new.
	component4 add: 4.
	component4 add: 5.
	component4 add: 6.
	
	self assert: (result includes: component1).
	self assert: (result includes: component2).
	self assert: (result includes: component3).
	self assert: (result includes: component4).

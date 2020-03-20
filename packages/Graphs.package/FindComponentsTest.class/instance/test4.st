as yet unclassified
test4
	"
	Graph:
	1 - 2 - 3
	4 - 5
	6 - 7
	"

	| graph result component1 component2 component3 |
	graph := Graph new.
	graph addEdgeFrom: 1 to: 2.
	graph addEdgeFrom: 2 to: 3.
	graph addEdgeFrom: 4 to: 5.
	graph addEdgeFrom: 6 to: 7.
	
	result := (FindComponents new: graph) result.
	
	component1 := Set new.
	component1 add: 1.
	component1 add: 2.
	component1 add: 3.
	
	component2 := Set new.
	component2 add: 4.
	component2 add: 5.
	
	component3 := Set new.
	component3 add: 6.
	component3 add: 7.
	
	self assert: (result includes: component1).
	self assert: (result includes: component2).
	self assert: (result includes: component3).

left recursion graph
buildLeftRecursionGraph
	leftRecursionGraph := DirectedGraph new.
	
	derivationGraph nodes do: [:generator |
		| name |
		name := derivationGraph nodeData: generator at: #name.
		self addToLeftRecursionGraph: generator withName: name]
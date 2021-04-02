accessing
connectParents: aNode

	aNode children do: [:child |
		child parent: aNode.
		child isTerminal ifFalse: [
			self connectParents: child]]
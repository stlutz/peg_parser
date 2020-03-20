as yet unclassified
result
	| components |
	components := (FindComponents new: graph) result.
	
	stack := LinkedList new.
	inStack := Set new.
	result := LinkedList new.
	
	components do: [:component |
		currComponent := component.
		self visit: (currComponent anyOne)].
	
	^ result withoutDuplicates asArray

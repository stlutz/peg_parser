as yet unclassified
generateChildNames: childCount
	| childNames |
	childNames := Array new: childCount.
	1 to: childCount do: [:index |
		childNames at: index put: name, '_', index].
	^ childNames
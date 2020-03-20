selector generation
childNames: aName count: childCount
	| childNames |
	childNames := Array new: childCount.
	1 to: childCount do: [:index |
		childNames at: index put: aName, '_', index].
	^ childNames
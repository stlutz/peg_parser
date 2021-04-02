private
rows: pegNodes toColumns: arrayOfCollections

	self flag: #todo. "can we get rid of this?"
	pegNodes do: [:node |
		node nodeList withIndexDo: [:child :index |
			(arrayOfCollections at: index) add: child]]
private
rows: pegNodes toColumns: arrayOfCollections

	pegNodes do: [:node |
		node nodeList withIndexDo: [:child :index |
			(arrayOfCollections at: index) add: child]]
method body generation
methodBody

	^ self methodBodyTemplate format: {
		self startChar storeString.
		self endChar storeString.
		self startChar asInteger storeString .
		self endChar asInteger storeString. }
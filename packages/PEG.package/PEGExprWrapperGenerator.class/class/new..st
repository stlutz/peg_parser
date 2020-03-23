instance creation
new: childGenerator
	^ self new
		childGenerator: childGenerator;
		yourself
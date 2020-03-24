instance creation
newWithSeed: ast withRule: ruleMethod
	^ self new
		seed: ast;
		ruleMethod: ruleMethod;
		yourself
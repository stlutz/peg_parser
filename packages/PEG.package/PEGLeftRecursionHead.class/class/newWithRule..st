instance creation
newWithRule: ruleMethod
	^ self new
		ruleMethod: ruleMethod;
		involvedSet: IdentitySet new;
		evalSet: IdentitySet new;
		yourself
as yet unclassified
newWithRule: ruleMethod
	^ self new
		ruleMethod: ruleMethod;
		involvedSet: IdentitySet new;
		evalSet: IdentitySet new;
		yourself
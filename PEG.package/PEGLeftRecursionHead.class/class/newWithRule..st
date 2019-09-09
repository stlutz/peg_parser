as yet unclassified
newWithRule: ruleName
	^ self new
		ruleName: ruleName;
		involvedSet: IdentitySet new;
		evalSet: IdentitySet new;
		yourself
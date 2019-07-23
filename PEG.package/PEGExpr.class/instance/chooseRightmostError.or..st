as yet unclassified
chooseRightmostError: error1 or: error2
	^ error2
			ifNil: [error1]
			ifNotNil: [error1
				ifNil: [error2]
				ifNotNil: [error1 pos >= error2 pos ifTrue: [error1] ifFalse: [error2]]]
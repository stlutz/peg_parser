as yet unclassified
methodBodyMockWith: childCount
	| headerCode elementCode footerCode code |
	headerCode := '| currentPos currentResult children |
	currentPos := pos.
	children := OrderedCollection new: ' , childCount , '.'.
	elementCode := 'currentPos := self skipSpaces: currentPos.
	currentResult := self {1}: currentPos.
	currentResult
		ifNil: [^ nil]
		ifNotNil: [
			currentPos := currentResult endPos.
			children add: currentResult].'.
	footerCode := '^ PEGShadowNode newOn: #shadow from: pos to: currentPos children: (children collect: #nodeList) flatten'.

	code := headerCode , Character lf , Character lf.
	1 to: childCount do: [:index | code := code , (elementCode format: {'{' , index , '}'}) , Character lf , Character lf].
	code := code , footerCode.
	
	^ code
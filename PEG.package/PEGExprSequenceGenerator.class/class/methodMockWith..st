as yet unclassified
methodMockWith: childCount
	| headerCode elementCode footerCode code |
	headerCode := 'parse{1}: string atPos: pos
	| currentPos currentResult children |
	currentPos := pos.
	children := OrderedCollection new: ' , childCount , '.'.
	elementCode := 'currentResult := self parse{1} atPos: pos.
	currentResult
		ifNil: [^ nil]
		ifNotNil: [
			currentPos := currentResult endPos.
			children add: currentResult].'.
	footerCode := '^ PEGShadowAbstractSyntaxTreeNode new
		rule: #sequence;
		startPos: pos;
		endPos: currentResult endPos;
		children: children;
		yourself'.

	code := headerCode , Character linefeed.
	1 to: childCount do: [:index | code := code , elementCode format: {'{' , (index + 1) , '}'} , Character linefeed].
	code := code , footerCode.
	
	^ code
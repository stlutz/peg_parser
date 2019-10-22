as yet unclassified
methodStrings
	| classes methodStrings |
	classes := self plainClasses.
	
	methodStrings := OrderedCollection new: (classes collect: [:cls | cls methodDict keys]) flatten size.
	classes do: [:class |
		class methodDict keys do: [:methodKey |
			methodStrings add: {class .(class sourceCodeAt: methodKey) asString}]].
	
	^ methodStrings
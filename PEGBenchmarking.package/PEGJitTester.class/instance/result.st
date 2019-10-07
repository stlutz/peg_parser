as yet unclassified
result
	| parser times class sourceCode |

	parser := Parser new.
	times := LinkedList new.

	class := SmalltalkImage.
	sourceCode := class sourceCodeAt: #'vmStatisticsReportString'.

	(0 to: 2000) do: [:i |
		| time |
		time := [parser parse: sourceCode class: class] timeToRunWithoutGC.
		times add: time].

	^ times

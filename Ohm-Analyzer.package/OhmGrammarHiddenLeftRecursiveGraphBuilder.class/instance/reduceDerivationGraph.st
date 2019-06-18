as yet unclassified
reduceDerivationGraph
	| queue addParsesEpsilon |

	queue := LinkedList new.
	derivationGraph nodes do: [:expr |
		derivationGraph nodeData: expr at: #parsesEpsilon put: false.
		queue add: expr].

	addParsesEpsilon := [:expr |
		derivationGraph nodeData: expr at: #parsesEpsilon put: true.
		queue addAll: (derivationGraph predecessors: expr)].

	[queue isEmpty] whileFalse: [
		| expr |
		expr := queue removeFirst.
		(derivationGraph nodeData: expr at: #parsesEpsilon) ifFalse: [
			(expr isMemberOf: OhmPExprAlt) ifTrue: [
				((derivationGraph successors: expr) anySatisfy: [:succ |
					derivationGraph nodeData: succ at: #parsesEpsilon]) ifTrue: [
						addParsesEpsilon value: expr]].
			(expr isMemberOf: OhmPExprApply) ifTrue: [
				(derivationGraph nodeData: ((derivationGraph successors: expr) at: 1) at: #parsesEpsilon) ifTrue: [
					addParsesEpsilon value: expr]].
			((expr isKindOf: OhmPExprLookahead) or: [expr isMemberOf: OhmPExprOpt]) ifTrue: [
				addParsesEpsilon value: expr].
			(expr isMemberOf: OhmPExprMany) ifTrue: [
				((expr min == 0) or: [(derivationGraph successors: expr) anySatisfy: [:succ |
					derivationGraph nodeData: succ at: #parsesEpsilon]]) ifTrue: [
						addParsesEpsilon value: expr]].
			((expr isMemberOf: OhmPExprCaseInsensitive) or: [expr isMemberOf: OhmPExprString]) ifTrue: [
				(expr matchString size == 0) ifTrue: [
					addParsesEpsilon value: expr]].
			(expr isMemberOf: OhmPExprSeq) ifTrue: [
				((derivationGraph successors: expr) allSatisfy: [:succ |
					derivationGraph nodeData: succ at: #parsesEpsilon]) ifTrue: [
						addParsesEpsilon value: expr]].
		].
	]
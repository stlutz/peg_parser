reduce derivation graph
reduceDerivationGraph
	| queue addParsesEpsilon |

	queue := LinkedList new.

	derivationGraph nodes do: [:generator |
		derivationGraph nodeData: generator at: #parsesEpsilon put: false.
		queue add: generator].

	addParsesEpsilon := [:generator |
		derivationGraph nodeData: generator at: #parsesEpsilon put: true.
		queue addAll: (derivationGraph predecessors: generator)].

	[queue isEmpty] whileFalse: [
		| generator |
		generator := queue removeFirst.
		(derivationGraph nodeData: generator at: #parsesEpsilon) ifFalse: [
			"Alternatives"
			(generator isMemberOf: PEGExprAlternativesGenerator) ifTrue: [
				((derivationGraph successors: generator) anySatisfy: [:succ |
					derivationGraph nodeData: succ at: #parsesEpsilon]) ifTrue: [
						addParsesEpsilon value: generator]].
			
			"Apply"
			(generator isKindOf: PEGExprLexicalApplyWrapperGenerator) ifTrue: [
				(derivationGraph nodeData: ((derivationGraph successors: generator) at: 1) at: #parsesEpsilon) ifTrue: [
					addParsesEpsilon value: generator]].
			
			"Lookahead Not Optional"
			((generator isMemberOf: PEGExprLookaheadGenerator) or:
			[generator isMemberOf: PEGExprNotGenerator] or:
			[generator isMemberOf: PEGExprOptionalGenerator]) ifTrue: [
				addParsesEpsilon value: generator].
			
			"ZeroOrMore"
			((generator isMemberOf: PEGExprLexicalZeroOrMoreGenerator) or:
			[generator isMemberOf: PEGExprSyntacticalZeroOrMoreGenerator]) ifTrue: [
				addParsesEpsilon value: generator].
			
			"OneOrMore"
			((generator isMemberOf: PEGExprLexicalOneOrMoreGenerator) or:
			[generator isMemberOf: PEGExprSyntacticalOneOrMoreGenerator]) ifTrue: [
				((derivationGraph successors: generator)
					anySatisfy: [:succ | derivationGraph nodeData: succ at: #parsesEpsilon]) ifTrue: [
						addParsesEpsilon value: generator]].

			"String"
			((generator isMemberOf: PEGExprStringGenerator) and: [(generator literalDict at: #matchString) size == 0]) ifTrue: [
				addParsesEpsilon value: generator].

			"Sequence"
			((generator isMemberOf: PEGExprLexicalSequenceGenerator) or:
			[generator isMemberOf: PEGExprSyntacticalSequenceGenerator]) ifTrue: [
				((derivationGraph successors: generator) allSatisfy: [:succ |
					derivationGraph nodeData: succ at: #parsesEpsilon]) ifTrue: [
						addParsesEpsilon value: generator]].
		]]
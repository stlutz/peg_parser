as yet unclassified
go
	| b |
	b := PEGBuilder new.
	b addRule: #ArrayLiteral withExpr:
		(b seq: {b apply: #spaces . b alt: {
			b apply: #ByteArrayLiteral .
			b apply: #ObjectArrayLiteral .
			b apply: #LiteralArrayLiteral}}).

	b addRule: #AssignmentOperation withExpr:
		(b seq: {b apply: #spaces . b apply: #bindableIdentifier . b apply: #assignmentOperator}).

	b addRule: #BinaryMessage withExpr:
		(b seq: {b apply: #spaces . b apply: #binaryMessageSelector . b apply: #BinaryMessageOperand}).

	b addRule: #BinaryMessageChain withExpr:
		(b seq: {b apply: #spaces . b plus: (b apply: #BinaryMessage)}).

	b addRule: #BinaryMesageOperand withExpr:
		(b seq: {b apply: #spaces . b apply: #Operand . b opt: (b apply: #UnaryMessageChain)}).

	b addRule: #BinaryMethodHeader withExpr:
		(b seq: {b apply: #spaces . b apply: #binaryMessageSelector . b apply: #bindableIdentifier}).

	b addRule: #BlockArguments withExpr:
		(b seq: {b apply: #spaces . b plus: (b apply: #blockArgument) . b str: '|'}).

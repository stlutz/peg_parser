as yet unclassified
go
	| grammarDefinition grammar |
	grammarDefinition := 'OhmSmalltalk {

ArrayLiteral =
	ByteArrayLiteral
	| ObjectArrayLiteral
      | LiteralArrayLiteral

AssignmentOperation =
    bindableIdentifier assignmentOperator

BinaryMessage =
    binaryMessageSelector BinaryMessageOperand

BinaryMessageChain =
    BinaryMessage+

BinaryMessageOperand =
    Operand UnaryMessageChain?

BinaryMethodHeader =
    binaryMessageSelector bindableIdentifier

BlockArguments =
	blockArgument+ "|"

BlockLiteral =
	"[" BlockArguments? ExecutableCode? "]" -- normal
	| "[" blockArgument+ "]" -- specialEmpty

ByteArrayLiteral =
	"#[" integerLiteral* "]"

CascadedMessage =
	";" MessageChain

ExecutableCode =
   LocalVariableDeclarationList? Pragmas? MoreExecutableCode

Expression =
	Operand (MessageChain CascadedMessage*)?

FinalStatement =
	"^"? Statement "."?

KeywordMessage =
    KeywordMessageSegment+

KeywordMessageArgument =
    BinaryMessageOperand BinaryMessageChain?

KeywordMessageSegment =
    keyword KeywordMessageArgument

KeywordMethodHeader =
    KeywordMethodHeaderSegment+

KeywordMethodHeaderSegment =
    keyword bindableIdentifier

KeywordPragma = pragmaKey pragmaLiteral*

Literal =
	constantReference
	| scaledDecimalLiteral
	| floatingPointLiteral
	| integerLiteral
	| characterLiteral
	| stringLiteral
	| symbolLiteral
	| ArrayLiteral
	| BlockLiteral

LiteralArrayLiteral =
  "#(" literalArrayLiteralElement*  ")"

LiteralArrayLiteralInLiteralArray =
  "#"? "(" literalArrayLiteralElement*  ")"

LocalVariableDeclarationList =
 "|" bindableIdentifier* "|"

MessageChain =
    KeywordMessage --keyword
    | BinaryMessage BinaryMessageChain? KeywordMessage? --binary
    | UnaryMessage UnaryMessageChain? BinaryMessageChain? KeywordMessage? --unary

MethodDeclaration =
  MethodHeader 
  Pragmas
  ExecutableCode

MethodHeader =
    KeywordMethodHeader
    | BinaryMethodHeader
    | UnaryMethodHeader

MethodReturnOperator =
    "^"

MoreExecutableCode = 
    Statements FinalStatement?

NestedExpression =
    "(" Statement ")"

ObjectArrayLiteral =
    "{" ObjectArrayLiteralElement* "}"

ObjectArrayLiteralElement =
  Statement "." --normal
  | Statement --finalExpression

Operand =
    Literal
    | Reference
    | NestedExpression

Pragma = 
  "<" PragmaValues ">"

PragmaValues = KeywordPragma+ | unaryPragma

Pragmas =
  Pragma*

Reference = 
    identifier

Statement =
    AssignmentOperation* Expression

Statements =
    (~MethodReturnOperator Statement? ".")*

UnaryMessage =
    ~keyword UnaryMessageSelector

UnaryMessageChain =
    UnaryMessage+

UnaryMessageSelector =
    identifier

UnaryMethodHeader =
    UnaryMessageSelector

assignmentOperator =
    ":=" | "_"

baseNIntegerLiteral =
	numberSigns? alnum+

binaryMessageSelector =
    binarySelectorChar binarySelectorChar? binarySelectorChar?

binarySelectorChar =
    "~" | "!" | "@" | "%" | "&" | "*" | "-" | "+" | "=" | "|" | "\\" | "<" | ">" | "," | "?" | "/"

bindableIdentifier =
	~(reservedIdentifier space) identifier

blockArgument =
	":" space* letter alnum*

byteArrayNumber =
	digit 				-- oneDigit
	| digit digit 			-- twoDigits
	| ("1"|"2") digit digit      -- threeDigits

characterLiteral =
	"$" (any | space)

comment =
	"\"" (~"\"" (any | " " | "\n"))* "\""

constantReference =
	"true"
	| "false"
	| "nil"

decimalIntegerLiteral
  = numberSigns? digit+

exponent
  = ("e" | "d" | "q")? 
decimalIntegerLiteral

floatingPointLiteral 
	= radixFloatingPointLiteral
         | normalFloatingPointLiteral

identifier =
	letter (alnum | "_")*

integerLiteral = 
	numberSigns? radix "r" baseNIntegerLiteral --radix
	| numberSigns? digit+ --normal

keyword =
	identifier ":"

literalArrayLiteralElement =
    floatingPointLiteral
    | integerLiteral
    | constantReference
    | stringLiteral
    | ByteArrayLiteral
    | symbolInArrayLiteral
    | symbolLiteral
    | characterLiteral
    | LiteralArrayLiteralInLiteralArray

normalFloatingPointLiteral
	= decimalIntegerLiteral ("." digit+)? exponent --exponent
     | decimalIntegerLiteral "." digit+  --normal

numberSigns
	= "-"

pragmaKey = identifier ":"

pragmaLiteral = ~pragmaKey ~">" literalArrayLiteralElement

pseudoVariableReference = 
	"self" | "super" | "thisContext"

radix =
	decimalIntegerLiteral

radixFloatingPointLiteral
	= decimalIntegerLiteral "r" normalFloatingPointLiteral

reservedIdentifier =
	constantReference | pseudoVariableReference

scaledDecimalLiteral =
	decimalIntegerLiteral ("." digit+)? "s" decimalIntegerLiteral?

/*
space +=
	comment
*/

stringLiteral =
	"\''" (~"\''" any | "\''\''")* "\''"

symbolInArrayLiteral =
    letter (alnum | ":")* --plain
    | binaryMessageSelector --binarySelector
    | (alnum | "." | "," | ":" | "[" | "]" | "|" | "^" | assignmentOperator)+ --code

symbolLiteral =
	"#" space* letter (alnum | ":" | "_")* -- normal
	| "#" space*  stringLiteral -- fromString
	| "#" space*  binaryMessageSelector -- fromBinarySelector
	| "#:" -- colonSymbol

unaryPragma = identifier


// ----------------------

spaces = space*
}'.

	grammar := OhmGrammar new: grammarDefinition.
	grammar ruleDeclarations at: #space put: (
		OhmRuleDefine newNamed: #space parameters: #() body: (
			OhmPExprAlt newOn: {OhmPExprApply newOn: #comment . OhmPExprRange newFrom: Character null to: Character space})).
	grammar ruleDeclarations at: #alnum put: (
		OhmRuleDefine newNamed: #alnum parameters: #() body: (
			OhmPExprAlt newOn: {OhmPExprApply newOn: #letter . OhmPExprApply newOn: #digit})).
	grammar ruleDeclarations at: #letter put: (
		OhmRuleDefine newNamed: #letter parameters: #() body: (
			OhmPExprAlt newOn: {OhmPExprApply newOn: #lower . OhmPExprApply newOn: #upper})).
	grammar ruleDeclarations at: #lower put: (
		OhmRuleDefine newNamed: #lower parameters: #() body: (
			OhmPExprRange newFrom: $a to: $z)).
	grammar ruleDeclarations at: #upper put: (
		OhmRuleDefine newNamed: #upper parameters: #() body: (
			OhmPExprRange newFrom: $A to: $Z)).
	grammar ruleDeclarations at: #digit put: (
		OhmRuleDefine newNamed: #digit parameters: #() body: (
			OhmPExprRange newFrom: $0 to: $9)).
	grammar ruleDeclarations at: #any put: (
		OhmRuleDefine newNamed: #any parameters: #() body: (
			OhmPExprAnything new)).

	^ (PEGOhmGrammarConverter new: grammar) result
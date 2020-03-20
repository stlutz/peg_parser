as yet unclassified
create
	| b |
	b := OhmGrammarBuilder new.

	b addRule: #expr as: (b apply: #addexpr).
	b addRule: #expr as: (b apply: #addexpr).

	b addRule: #addexpr as: (b alt: {b apply: #addexpr_plus . b apply: #addexpr_minus . b apply: #mulexpr}).
	b addRule: #addexpr_plus as: (b seq: {b apply: #addexpr . b string: '+' . b apply: #mulexpr}).
	b addRule: #addexpr_minus as: (b seq: {b apply: #addexpr . b string: '-' . b apply: #mulexpr}).

	b addRule: #mulexpr as: (b alt: {b apply: #mulexpr_times . b apply: #mulexpr_divide . b apply: #expexpr}).
	b addRule: #mulexpr_times as: (b seq: {b apply: #mulexpr . b string: '*' . b apply: #expexpr}).
	b addRule: #mulexpr_divide as: (b seq: {b apply: #mulexpr . b string: '/' . b apply: #expexpr}).

	b addRule: #expexpr as: (b alt: {b apply: #expexpr_power . b apply: #priexpr}).
	b addRule: #expexpr_power as: (b seq: {b apply: #priexpr . b string: '^' . b apply: #expexpr}).

	b addRule: #priexpr as: (b alt: {b apply: #priexpr_paren . b apply: #priexpr_pos . b apply: #priexpr_neb . b apply: #number}).
	b addRule: #priexpr_paren as: (b seq: {b string: '(' . b apply: #expr . b string: ')'}).
	b addRule: #priexpr_pos as: (b seq: {b string: '+' . b apply: #priexpr}).
	b addRule: #priexpr_neb as: (b seq: {b string: '-' . b apply: #priexpr}).

	b addRule: #number as: (b alt: {b apply: #number_frac . b apply: #number_int}).
	b addRule: #number_frac as: (b seq: {b star: (b apply: #digit) .b string: '.' . b plus: (b apply: #digit)}).
	b addRule: #number_int as: (b plus: (b apply: #digit)).

	b addRule: #digit as: (b rangeFrom: $0 to: $9).
	
	^ b
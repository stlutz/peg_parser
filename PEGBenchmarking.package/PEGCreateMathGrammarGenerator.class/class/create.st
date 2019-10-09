as yet unclassified
create
	| g |
	g := PEGParserGenerator new.

	g defineRule: #expr withExpr: (g apply: #addexpr).

	g defineRule: #addexpr withExpr: (g alt: {g apply: #addexpr_plus . g apply: #addexpr_minus . g apply: #mulexpr}).
	g defineRule: #addexpr_plus withExpr: (g seq: {g apply: #addexpr . g str: '+' . g apply: #mulexpr}).
	g defineRule: #addexpr_minus withExpr: (g seq: {g apply: #addexpr . g str: '-' . g apply: #mulexpr}).

	g defineRule: #mulexpr withExpr: (g alt: {g apply: #mulexpr_times . g apply: #mulexpr_divide . g apply: #expexpr}).
	g defineRule: #mulexpr_times withExpr: (g seq: {g apply: #mulexpr . g str: '*' . g apply: #expexpr}).
	g defineRule: #mulexpr_divide withExpr: (g seq: {g apply: #mulexpr . g str: '/' . g apply: #expexpr}).

	g defineRule: #expexpr withExpr: (g alt: {g apply: #expexpr_power . g apply: #priexpr}).
	g defineRule: #expexpr_power withExpr: (g seq: {g apply: #priexpr . g str: '^' . g apply: #expexpr}).

	g defineRule: #priexpr withExpr: (g alt: {g apply: #priexpr_paren . g apply: #priexpr_pos . g apply: #priexpr_neg . g apply: #number}).
	g defineRule: #priexpr_paren withExpr: (g seq: {g str: '(' . g apply: #expr . g str: ')'}).
	g defineRule: #priexpr_pos withExpr: (g seq: {g str: '+' . g apply: #priexpr}).
	g defineRule: #priexpr_neg withExpr: (g seq: {g str: '-' . g apply: #priexpr}).

	g defineRule: #number withExpr: (g alt: {g apply: #number_frac . g apply: #number_int}).
	g defineRule: #number_frac withExpr: (g seq: {g star: (g apply: #digit) .g str: '.' . g plus: (g apply: #digit)}).
	g defineRule: #number_int withExpr: (g plus: (g apply: #digit)).

	g defineRule: #digit withExpr: (g range: $0 to: $9).
	
	^ g
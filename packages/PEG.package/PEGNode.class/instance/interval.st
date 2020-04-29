accessing
interval
	"for compatibility with Ohm/S"
	
	 ^ OhmInterval 
		newOn: self contents readStream
		from: self startPos 
		to: self endPos - 1 
accessing
interval
	"for compatibility with Ohm/S"
	
	^ (self contents copyFrom: self startPos to: self endPos) readStream 
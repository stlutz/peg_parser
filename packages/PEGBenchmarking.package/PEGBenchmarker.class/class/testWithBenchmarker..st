as yet unclassified
testWithBenchmarker: aBenchmarker
	| classes results |
	
	classes :=
		{ConnectionClosed . UTF8TextConverterTest . AllNamePolicy . UserScript . PointType .
		  ScrapBook . PCXReadWriter . UnhandledWarning . FontTest . AlphaBlendingCanvas .
		  PlayingCardDeck . ParseStack . SqueakSSLCertificateError . RxsNode . MutexSet .
		  NullCanvas . MyTestNotification . KoreanEnvironment . ProcessSpecificVariable . SqueakTheme .
		  ServiceCancelled . Flaps . RWBinaryOrTextStreamTest . CompositeTransform . Base64MimeConverter .
		  StrikeFontFixer . MouseButtonEvent . UTF16TextConverter . IntervalTest . WireMorph .
		  CompilerExceptionsTest . MethodNode . ClassBindingTest . MethodTempsNode . ColorTileMorph .
		  TextSqkProjectLink . GIFReadWriter . MIMEType . Matrix . IdentityBagTest .
		  PluggableButtonSpec . MorphicTestTextModel . CompiledMethodInspector . ScreenController . ColorForm}.
	
	aBenchmarker initialize.
	results := LinkedList new.
	classes do: [:cls |
			(cls methodDict keys collect: [:key |
				(cls sourceCodeAt: key) asString
			]) do: [:methodString |
				results add: (aBenchmarker run: methodString withClass: cls).
			]
	] displayingProgress: [:cls | cls name asString].
	
	^results.

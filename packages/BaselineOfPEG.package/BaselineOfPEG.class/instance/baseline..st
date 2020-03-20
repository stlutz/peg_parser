baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			spec
				package: 'PEG' with: [spec requires: #(libraries)];
				baseline: 'Ohm' with: [spec repository: 'github://hpi-swa/Ohm-S:master/packages'];
				yourself.
			spec
				group: 'default' with: #('PEG');
				group: 'libraries' with: #('Ohm')].
	^ spec
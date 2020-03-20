private
newRandomString

	^ (Random new next asString allButFirst: 2) allButLast: 2
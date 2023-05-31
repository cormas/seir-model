Class {
	#name : #REDSusceptibleStateTest,
	#superclass : #REDStateTest,
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDSusceptibleStateTest >> stateClass [

	^ REDSusceptibleState
]

{ #category : #'as yet unclassified' }
REDSusceptibleStateTest >> testIsSusceptible [

	"With a fixed random seed 42, the generated sequence of random numbers are
	#(0.8193728517100656 0.4832677010338043 0.8838065384920546 0.5448508591225051 0.8591746499733108 0.9181291652326767 0.9086380098559519 0.9643509794648097 0.39743731950979955 0.23500392111465765)
	
	The infectionProbability is 0.3934693402873666
	
	Therefore, during the first 9 days individual will remain in the Susceptible state, and on day 10 they become Exposed"

	9 timesRepeat: [ 
		self assert: state newState isSusceptible ].
	
	self assert: state newState isExposed.
]

{ #category : #tests }
REDSusceptibleStateTest >> testNewState [

	"With a fixed random seed 42, the generated sequence of random numbers are
	#(0.8193728517100656 0.4832677010338043 0.8838065384920546 0.5448508591225051 0.8591746499733108 0.9181291652326767 0.9086380098559519 0.9643509794648097 0.39743731950979955 0.23500392111465765)
	
	The infectionProbability is 0.3934693402873666
	
	Therefore, during the first 9 days individual will remain in the Susceptible state, and on day 10 they become Exposed"

	9 timesRepeat: [ 
		self assert: state newState isSusceptible ].
	
	self assert: state newState isExposed.
]

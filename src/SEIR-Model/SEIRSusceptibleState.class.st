Class {
	#name : #SEIRSusceptibleState,
	#superclass : #SEIRState,
	#category : #'SEIR-Model-State'
}

{ #category : #accessing }
SEIRSusceptibleState >> color [

	^ Color gray
]

{ #category : #testing }
SEIRSusceptibleState >> isSusceptible [

	^ true
]

{ #category : #'instance creation' }
SEIRSusceptibleState >> newState [

	| rand |
	rand := individual cormasModel randomNumberGenerator. 

	^ rand floatValue < individual infectionProbability
		ifTrue: [ SEIRExposedState forIndividual: individual ]
		ifFalse: [ self ]
]

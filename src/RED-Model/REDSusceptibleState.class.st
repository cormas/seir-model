Class {
	#name : #REDSusceptibleState,
	#superclass : #REDState,
	#category : #'RED-Model-State'
}

{ #category : #accessing }
REDSusceptibleState >> color [

	^ Color gray
]

{ #category : #testing }
REDSusceptibleState >> isSusceptible [

	^ true
]

{ #category : #'instance creation' }
REDSusceptibleState >> newState [

	^ Random new next < individual infectionProbability
		ifTrue: [ REDExposedState forIndividual: individual ]
		ifFalse: [ self ]
]

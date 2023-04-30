Class {
	#name : #REDSusceptibleState,
	#superclass : #REDState,
	#category : #'RED-Model'
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

	^ (individual neighbouringSimilarAgents anySatisfy: [ :neighbour | neighbour isInfectious ])
		ifTrue: [ REDExposedState forIndividual: individual ]
		ifFalse: [ self ]
]

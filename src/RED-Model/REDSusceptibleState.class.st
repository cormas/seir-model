Class {
	#name : #REDSusceptibleState,
	#superclass : #REDState,
	#category : #'RED-Model'
}

{ #category : #'as yet unclassified' }
REDSusceptibleState class >> infectionRate [

	^ 0.5
]

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

	| infectionProbability |
	
	infectionProbability := self class infectionRate * individual numberOfInfectiousNeighbours / 8.

	^ Random new next < infectionProbability
		ifTrue: [ REDExposedState forIndividual: individual ]
		ifFalse: [ self ]
]

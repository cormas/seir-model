Class {
	#name : #REDIndividual,
	#superclass : #CMAgentLocation,
	#instVars : [
		'state'
	],
	#category : #'RED-Model'
}

{ #category : #accessing }
REDIndividual class >> entityName [

	^ 'Individual'
]

{ #category : #'as yet unclassified' }
REDIndividual class >> initialInfectionProbability [
	"The probability that an individual is initialized with infection"
	
	^ 0.001
]

{ #category : #initialization }
REDIndividual >> initialize [

	super initialize.
	
	state := Random new next > self class initialInfectionProbability
		ifTrue: [ REDSusceptibleState forIndividual: self ]
		ifFalse: [ REDInfectiousState forIndividual: self ].
]

{ #category : #testing }
REDIndividual >> isExposed [

	^ state isExposed
]

{ #category : #testing }
REDIndividual >> isInfectious [

	^ state isInfectious
]

{ #category : #testing }
REDIndividual >> isRecovered [

	^ state isRecovered
]

{ #category : #testing }
REDIndividual >> isSusceptible [

	^ state isSusceptible
]

{ #category : #accessing }
REDIndividual >> move [

	self randomWalkConstrainedBy: [ :cell | cell noOccupant ].
]

{ #category : #'as yet unclassified' }
REDIndividual >> numberOfInfectiousNeighbours [

	^ (self neighbouringSimilarAgents select: [ :each | each isInfectious ]) size
]

{ #category : #pov }
REDIndividual >> pov [

	^ state color
]

{ #category : #accessing }
REDIndividual >> step [

	self move.
	state := state newState.
]

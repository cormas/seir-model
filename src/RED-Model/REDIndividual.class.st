Class {
	#name : #REDIndividual,
	#superclass : #CMAgentLocation,
	#instVars : [
		'state'
	],
	#category : #'RED-Model'
}

{ #category : #'as yet unclassified' }
REDIndividual class >> initialInfectionProbability [
	"The probability that an individual is initialized with infection"
	
	^ 0.001
]

{ #category : #initialization }
REDIndividual >> initialize [

	super initialize.
	
	state := Random new > self class initialInfectionProbability
		ifTrue: [ REDSusceptibleState forIndividual: self ]
		ifFalse: [ REDInfectiousState forIndividual: self ].
]

{ #category : #accessing }
REDIndividual >> move [

	self randomWalkConstrainedBy: [ :cell | cell noOccupant ].
]

{ #category : #accessing }
REDIndividual >> pov [

	^ state color
]

{ #category : #accessing }
REDIndividual >> step [

	self move.
	state := state newState.
]

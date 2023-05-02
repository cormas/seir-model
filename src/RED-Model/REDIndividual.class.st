Class {
	#name : #REDIndividual,
	#superclass : #CMAgentLocation,
	#instVars : [
		'state',
		'direction',
		'incubationPeriod',
		'infectiousPeriod',
		'immunityPeriod'
	],
	#category : #'RED-Model-Core'
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

{ #category : #'as yet unclassified' }
REDIndividual class >> meanImmunityPeriod [

	^ 365
]

{ #category : #'as yet unclassified' }
REDIndividual class >> meanIncubationPeriod [

	^ 3
]

{ #category : #'as yet unclassified' }
REDIndividual class >> meanInfectiousPeriod [

	^ 14
]

{ #category : #accessing }
REDIndividual >> immunityPeriod [
	"Personal immunity period"
	
	^ immunityPeriod
]

{ #category : #accessing }
REDIndividual >> incubationPeriod [
	"Personal incubation period"
	
	^ incubationPeriod
]

{ #category : #accessing }
REDIndividual >> infectiousPeriod [
	"Personal infectious period"
	
	^ infectiousPeriod
]

{ #category : #initialization }
REDIndividual >> initialize [

	super initialize.
	
	state := Random new next > self class initialInfectionProbability
		ifTrue: [ REDSusceptibleState forIndividual: self ]
		ifFalse: [ REDInfectiousState forIndividual: self ].
		
	direction := REDDirection randomForIndividual: self.
		
	incubationPeriod := (PMExponentialDistribution scale: self class meanIncubationPeriod)
		random asInteger.
		
	infectiousPeriod := (PMExponentialDistribution scale: self class meanInfectiousPeriod)
		random asInteger.
		
	immunityPeriod := (PMExponentialDistribution scale: self class meanImmunityPeriod)
		random asInteger.
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

	"self randomWalkConstrainedBy: [ :cell | cell noOccupant ]."
	
	direction := direction considerChangingDirection.
	
	direction canMoveForward
		ifTrue: [ direction moveForward ]
		ifFalse: [ direction := direction turnRandomly ].
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

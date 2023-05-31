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
REDIndividual class >> infectionRate [

	^ 0.5
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

	"^ 7"
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

{ #category : #'as yet unclassified' }
REDIndividual >> infect [
	"Infect this individual"
	state := REDInfectiousState forIndividual: self.
]

{ #category : #'as yet unclassified' }
REDIndividual >> infectionProbability [
	"The probability that a susceptible individual gets infected"
	^ 1 - (-1 * self class infectionRate * self numberOfInfectiousNeighbours) exp
]

{ #category : #accessing }
REDIndividual >> infectiousPeriod [
	"Personal infectious period"
	
	^ infectiousPeriod
]

{ #category : #initialization }
REDIndividual >> initialize [

	super initialize.
	
	state := REDSusceptibleState forIndividual: self.
	direction := REDDirection randomForIndividual: self.
		
	incubationPeriod := (PMExponentialDistribution scale: self class meanIncubationPeriod)
		random asInteger.
		
	infectiousPeriod := (PMExponentialDistribution scale: self class meanInfectiousPeriod)
		random asInteger.
		
	immunityPeriod := (PMExponentialDistribution scale: REDIndividual meanImmunityPeriod)
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

	"self moveRandomNeighbourhood."
	self randomJump.
]

{ #category : #accessing }
REDIndividual >> moveRandomDirection [
	"Move by choosing a direction and following it until we randomly choose to change it"
	direction := direction considerChangingDirection.
	
	direction canMoveForward
		ifTrue: [ direction moveForward ]
		ifFalse: [ direction := direction turnRandomly ].
]

{ #category : #accessing }
REDIndividual >> moveRandomNeighbourhood [
	"Move by selecting a random cell from the neighbourhood at each step"
	self randomWalk.
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

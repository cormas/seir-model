Class {
	#name : #SEIRIndividual,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'state',
		'incubationPeriod',
		'infectiousPeriod',
		'immunityPeriod'
	],
	#category : #'SEIR-Model-Core'
}

{ #category : #accessing }
SEIRIndividual class >> entityName [

	^ 'Individual'
]

{ #category : #'as yet unclassified' }
SEIRIndividual class >> infectionRate [

	^ 0.5
]

{ #category : #'as yet unclassified' }
SEIRIndividual class >> meanImmunityPeriod [

	^ 365
]

{ #category : #'as yet unclassified' }
SEIRIndividual class >> meanIncubationPeriod [

	^ 3
]

{ #category : #'as yet unclassified' }
SEIRIndividual class >> meanInfectiousPeriod [

	^ 7
]

{ #category : #accessing }
SEIRIndividual >> immunityPeriod [
	"Personal immunity period"
	
	^ immunityPeriod
]

{ #category : #accessing }
SEIRIndividual >> immunityPeriod: anInteger [
	"Personal immunity period"
	
	immunityPeriod := anInteger
]

{ #category : #accessing }
SEIRIndividual >> incubationPeriod [
	"Personal incubation period"
	
	^ incubationPeriod
]

{ #category : #accessing }
SEIRIndividual >> incubationPeriod: anInteger [
	"Personal incubation period"
	
	incubationPeriod := anInteger
]

{ #category : #'as yet unclassified' }
SEIRIndividual >> infect [
	"Infect this individual"
	state := SEIRInfectiousState forIndividual: self.
]

{ #category : #'as yet unclassified' }
SEIRIndividual >> infectionProbability [
	"The probability that a susceptible individual gets infected"
	^ 1 - (-1 * self class infectionRate * self numberOfInfectiousNeighbours) exp
]

{ #category : #accessing }
SEIRIndividual >> infectiousPeriod [
	"Personal infectious period"
	
	^ infectiousPeriod
]

{ #category : #accessing }
SEIRIndividual >> infectiousPeriod: anInteger [
	"Personal infectious period"
	
	infectiousPeriod := anInteger
]

{ #category : #initialization }
SEIRIndividual >> initialize [

	super initialize.
	
	state := SEIRSusceptibleState forIndividual: self.
		
	self initializeIncubationPeriod.
	self initializeInfectiousPeriod.
	self initializeImmunityPeriod.
]

{ #category : #initialization }
SEIRIndividual >> initializeImmunityPeriod [

	| distribution |
	
	distribution := PMExponentialDistribution scale: self class meanImmunityPeriod.
	immunityPeriod := distribution random asInteger.
]

{ #category : #initialization }
SEIRIndividual >> initializeIncubationPeriod [

	| distribution |
	
	distribution := PMExponentialDistribution scale: self class meanIncubationPeriod.
	incubationPeriod := distribution random asInteger.
]

{ #category : #initialization }
SEIRIndividual >> initializeInfectiousPeriod [

	| distribution |
	
	distribution := PMExponentialDistribution scale: self class meanInfectiousPeriod.
	infectiousPeriod := distribution random asInteger.
]

{ #category : #testing }
SEIRIndividual >> isExposed [

	^ state isExposed
]

{ #category : #testing }
SEIRIndividual >> isInfectious [

	^ state isInfectious
]

{ #category : #testing }
SEIRIndividual >> isRecovered [

	^ state isRecovered
]

{ #category : #testing }
SEIRIndividual >> isSusceptible [

	^ state isSusceptible
]

{ #category : #accessing }
SEIRIndividual >> move [

	self randomJump.
]

{ #category : #'as yet unclassified' }
SEIRIndividual >> numberOfInfectiousNeighbours [

	^ ((self neighbouringSimilarAgents, self colocatedSimilarAgents)
		select: [ :each | each isInfectious ]) size
]

{ #category : #pov }
SEIRIndividual >> pov [

	^ state color
]

{ #category : #accessing }
SEIRIndividual >> step [

	self move.
	state := state newState.
]

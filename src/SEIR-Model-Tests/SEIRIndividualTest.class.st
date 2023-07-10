Class {
	#name : #SEIRIndividualTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'model',
		'infectedIndividual'
	],
	#category : #'SEIR-Model-Tests'
}

{ #category : #initialization }
SEIRIndividualTest >> setUp [

	| fixture |
	super setUp.
	
	fixture := SEIRModelFixture new.
	model := fixture model.
	individual := fixture individual.
	infectedIndividual := fixture infectedIndividual.
	
]

{ #category : #tests }
SEIRIndividualTest >> testInfect [

	individual infect.
	self assert: individual isInfectious
]

{ #category : #tests }
SEIRIndividualTest >> testInfectionProbability [

	self assert: individual infectionProbability >= 0.
	self assert: individual infectionProbability <= 1.
]

{ #category : #tests }
SEIRIndividualTest >> testInfectionProbabilityValue [

	"1 - (-1 * 0.5 * 1) exp = 0.3934693402873666"
	self assert: individual infectionProbability closeTo: 0.3934693402873666
]

{ #category : #tests }
SEIRIndividualTest >> testIsExposed [

	self deny: individual isExposed
]

{ #category : #tests }
SEIRIndividualTest >> testIsInfectious [

	self deny: individual isInfectious
]

{ #category : #tests }
SEIRIndividualTest >> testIsRecovered [

	self deny: individual isRecovered
]

{ #category : #tests }
SEIRIndividualTest >> testIsSusceptible [

	self assert: individual isSusceptible
]

{ #category : #tests }
SEIRIndividualTest >> testNumberOfInfectiousNeighbours [

	self assert: individual numberOfInfectiousNeighbours equals: 1
]

{ #category : #tests }
SEIRIndividualTest >> testNumberOfInfectiousNeighboursSameCell [
	"Create a new individual at the same cell as the only infected individual and check if the number of infectious neighbours is 1"
	| newIndividual |
	newIndividual := model newEntity: SEIRIndividual.
	newIndividual moveTo: infectedIndividual patch.

	self assert: newIndividual numberOfInfectiousNeighbours equals: 1
]

{ #category : #tests }
SEIRIndividualTest >> testPov [

	self assert: (individual pov isKindOf: Color)
]

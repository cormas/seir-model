Class {
	#name : #REDIndividualTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'model'
	],
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDIndividualTest >> setUp [

	| fixture |
	super setUp.
	
	fixture := REDModelFixture new.
	model := fixture model.
	individual := fixture individual.
	
]

{ #category : #tests }
REDIndividualTest >> testInfect [

	individual infect.
	self assert: individual isInfectious
]

{ #category : #tests }
REDIndividualTest >> testInfectionProbability [

	self assert: individual infectionProbability >= 0.
	self assert: individual infectionProbability <= 1.
]

{ #category : #tests }
REDIndividualTest >> testInfectionProbabilityValue [

	"1 - (-1 * 0.5 * 1) exp = 0.3934693402873666"
	self assert: individual infectionProbability closeTo: 0.3934693402873666
]

{ #category : #tests }
REDIndividualTest >> testIsExposed [

	self deny: individual isExposed
]

{ #category : #tests }
REDIndividualTest >> testIsInfectious [

	self deny: individual isInfectious
]

{ #category : #tests }
REDIndividualTest >> testIsRecovered [

	self deny: individual isRecovered
]

{ #category : #tests }
REDIndividualTest >> testIsSusceptible [

	self assert: individual isSusceptible
]

{ #category : #tests }
REDIndividualTest >> testPov [

	self assert: (individual pov isKindOf: Color)
]

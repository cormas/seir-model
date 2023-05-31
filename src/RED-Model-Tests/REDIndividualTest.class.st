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

	super setUp.
	
	model := REDModel new
		gridDimensions: 4@4;
		numberOfIndividuals: 0;
		initSimulation;
		yourself.
	
	individual := REDIndividual new.
	individual moveTo: (model cellAt: 2 at: 2).
	
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

Class {
	#name : #REDIndividualTest,
	#superclass : #TestCase,
	#instVars : [
		'individual'
	],
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDIndividualTest >> setUp [

	| model |
	super setUp.
	
	model := REDMockModel new.
	"model initializeSpaceModel.
	model perform: model class defaultInit."
	
	individual := REDIndividual new.
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

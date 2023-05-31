Class {
	#name : #REDModelParametersTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'model'
	],
	#category : #'RED-Model-Tests'
}

{ #category : #tests }
REDModelParametersTest >> testGridDimensions [

	self assert: REDModel new gridDimensions equals: 300@300
]

{ #category : #tests }
REDModelParametersTest >> testInfectionRate [

	self assert: REDIndividual infectionRate equals: 0.5
]

{ #category : #tests }
REDModelParametersTest >> testInitialInfectionProbability [

	self assert: REDModel new initialInfectionProbability equals: 0.001
	
]

{ #category : #tests }
REDModelParametersTest >> testMeanImmunityPeriod [

	self assert: REDIndividual meanImmunityPeriod equals: 365
]

{ #category : #tests }
REDModelParametersTest >> testMeanIncubationPeriod [

	self assert: REDIndividual meanIncubationPeriod equals: 3
]

{ #category : #tests }
REDModelParametersTest >> testMeanInfectiousPeriod [

	self assert: REDIndividual meanInfectiousPeriod equals: 7
]

{ #category : #tests }
REDModelParametersTest >> testNumberOfIndividuals [

	self assert: REDModel new numberOfIndividuals equals: 20000
]

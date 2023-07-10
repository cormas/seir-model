Class {
	#name : #SEIRModelParametersTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'model'
	],
	#category : #'SEIR-Model-Tests'
}

{ #category : #tests }
SEIRModelParametersTest >> testGridDimensions [

	self assert: SEIRModel new gridDimensions equals: 300@300
]

{ #category : #tests }
SEIRModelParametersTest >> testInfectionRate [

	self assert: SEIRIndividual infectionRate equals: 0.5
]

{ #category : #tests }
SEIRModelParametersTest >> testInitialInfectionProbability [

	self assert: SEIRModel new initialInfectionProbability equals: 0.001
	
]

{ #category : #tests }
SEIRModelParametersTest >> testMeanImmunityPeriod [

	self assert: SEIRIndividual meanImmunityPeriod equals: 365
]

{ #category : #tests }
SEIRModelParametersTest >> testMeanIncubationPeriod [

	self assert: SEIRIndividual meanIncubationPeriod equals: 3
]

{ #category : #tests }
SEIRModelParametersTest >> testMeanInfectiousPeriod [

	self assert: SEIRIndividual meanInfectiousPeriod equals: 7
]

{ #category : #tests }
SEIRModelParametersTest >> testNumberOfIndividuals [

	self assert: SEIRModel new numberOfIndividuals equals: 20000
]

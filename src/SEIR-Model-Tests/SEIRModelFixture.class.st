Class {
	#name : #SEIRModelFixture,
	#superclass : #Object,
	#instVars : [
		'model',
		'individual',
		'infectedIndividual'
	],
	#category : #'SEIR-Model-Tests'
}

{ #category : #accessing }
SEIRModelFixture >> individual [

	^ individual
]

{ #category : #accessing }
SEIRModelFixture >> infectedIndividual [

	^ infectedIndividual
]

{ #category : #initialization }
SEIRModelFixture >> initialize [

	super initialize.
	
	model := SEIRModel new
		gridDimensions: 4@4;
		numberOfIndividuals: 0;
		randomSeed: 42;
		initSimulation;
		yourself.
		
	individual := model newEntity: SEIRIndividual.
	individual moveTo: (model cellAt: 2 at: 3).
	
	infectedIndividual := model newEntity: SEIRIndividual.
	infectedIndividual infect.
	infectedIndividual moveTo: (model cellAt: 1 at: 2).
]

{ #category : #accessing }
SEIRModelFixture >> model [

	^ model
]

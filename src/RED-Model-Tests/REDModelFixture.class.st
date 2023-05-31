Class {
	#name : #REDModelFixture,
	#superclass : #Object,
	#instVars : [
		'model',
		'individual',
		'infectedIndividual'
	],
	#category : #'RED-Model-Tests'
}

{ #category : #accessing }
REDModelFixture >> individual [

	^ individual
]

{ #category : #accessing }
REDModelFixture >> infectedIndividual [

	^ infectedIndividual
]

{ #category : #initialization }
REDModelFixture >> initialize [

	super initialize.
	
	model := REDModel new
		gridDimensions: 4@4;
		numberOfIndividuals: 0;
		randomSeed: 42;
		initSimulation;
		yourself.
		
	individual := model newEntity: REDIndividual.
	individual moveTo: (model cellAt: 2 at: 3).
	
	infectedIndividual := model newEntity: REDIndividual.
	infectedIndividual infect.
	infectedIndividual moveTo: (model cellAt: 1 at: 2).
]

{ #category : #accessing }
REDModelFixture >> model [

	^ model
]

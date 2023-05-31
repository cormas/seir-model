Class {
	#name : #REDModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDModelTest >> setUp [

	super setUp.
	
	model := REDModel new
		gridDimensions: 4@4;
		numberOfIndividuals: 0;
		initSimulation;
		yourself.
]

{ #category : #tests }
REDModelTest >> testCellAtAt [

	self assert: (model cellAt: 1 at: 1) equals: model spaceModel upperLeftLocation.
	self assert: (model cellAt: 1 at: 4) equals: model spaceModel upperRightLocation.
	self assert: (model cellAt: 4 at: 1) equals: model spaceModel lowerLeftLocation.
	self assert: (model cellAt: 4 at: 4) equals: model spaceModel lowerRightLocation.
]

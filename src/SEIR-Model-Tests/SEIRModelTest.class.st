Class {
	#name : #SEIRModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'SEIR-Model-Tests'
}

{ #category : #initialization }
SEIRModelTest >> setUp [

	| fixture |
	super setUp.
	
	fixture := SEIRModelFixture new.
	model := fixture model.
	
]

{ #category : #tests }
SEIRModelTest >> testCellAtAt [

	self assert: (model cellAt: 1 at: 1) equals: model spaceModel upperLeftLocation.
	self assert: (model cellAt: 1 at: 4) equals: model spaceModel upperRightLocation.
	self assert: (model cellAt: 4 at: 1) equals: model spaceModel lowerLeftLocation.
	self assert: (model cellAt: 4 at: 4) equals: model spaceModel lowerRightLocation.
]

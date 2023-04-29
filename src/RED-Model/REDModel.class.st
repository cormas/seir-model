Class {
	#name : #REDModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theIndividuals',
		'theCells'
	],
	#category : #'RED-Model'
}

{ #category : #'simulation settings' }
REDModel class >> defaultInit [

	^ #init
]

{ #category : #'as yet unclassified' }
REDModel class >> numberOfIndividuals [

	^ 50
]

{ #category : #init }
REDModel >> init [

	self
		createGridLines: 100
		columns: 100
		neighbourhood: 8
		closed: true.
		
	self theREDCells.
		
	self
		createN: self class numberOfIndividuals
		randomlyLocatedAloneEntities: REDIndividual.
]

{ #category : #control }
REDModel >> step: anObject [

	self askRandom: REDIndividual toDo: #step
]

{ #category : #'as yet unclassified' }
REDModel >> theREDCells [

	^ theCells ifNil: [ OrderedCollection new ].
]

{ #category : #accessing }
REDModel >> theREDIndividuals [

	^ theIndividuals ifNil: [ OrderedCollection new ]
]

{ #category : #accessing }
REDModel >> theREDIndividuals: aCollection [

	theIndividuals := aCollection
]

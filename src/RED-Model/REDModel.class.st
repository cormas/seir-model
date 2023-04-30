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

	^ 1000
]

{ #category : #init }
REDModel >> init [

	self
		createGridLines: 100
		columns: 100
		neighbourhood: 8
		closed: true.
		
	self theCells do: [ :cell | cell ].
		
	self
		createN: self class numberOfIndividuals
		randomlyLocatedAloneEntities: REDIndividual.
]

{ #category : #control }
REDModel >> step: anObject [

	self askRandom: REDIndividual toDo: #step
]

{ #category : #'as yet unclassified' }
REDModel >> theCells [

	^ theCells ifNil: [ theCells := OrderedCollection new ].
]

{ #category : #'as yet unclassified' }
REDModel >> theCells: aCollection [

	theCells := aCollection
]

{ #category : #accessing }
REDModel >> theIndividuals [

	^ theIndividuals ifNil: [ theIndividuals := OrderedCollection new ]
]

{ #category : #accessing }
REDModel >> theIndividuals: aCollection [

	theIndividuals := aCollection
]

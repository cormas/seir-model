Class {
	#name : #REDModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theIndividuals'
	],
	#category : #'RED-Model'
}

{ #category : #'as yet unclassified' }
REDModel class >> numberOfIndividuals [

	^ 50
]

{ #category : #'initialize-release' }
REDModel >> init [

	self
		createGridLines: 100
		columns: 100
		neighbourhood: 8
		closed: true.
		
	self
		createN: self class numberOfIndividuals
		randomlyLocatedAloneEntities: REDIndividual.
]

{ #category : #accessing }
REDModel >> theIndividuals [

	^ theIndividuals ifNil: [ OrderedCollection new ]
]

{ #category : #accessing }
REDModel >> theIndividuals: aCollection [

	theIndividuals := aCollection
]

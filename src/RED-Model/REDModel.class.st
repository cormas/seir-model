Class {
	#name : #REDModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theIndividuals',
		'theCells'
	],
	#category : #'RED-Model-Core'
}

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfExposed [
  ^ Color yellow
]

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfInfectious [
  ^ Color red
]

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfRecovered [
  ^ Color green
]

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfSusceptible [
  ^ Color gray 
]

{ #category : #'simulation settings' }
REDModel class >> defaultInit [

	^ #init
]

{ #category : #'as yet unclassified' }
REDModel class >> numberOfIndividuals [

	^ 1500
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

{ #category : #probes }
REDModel >> numberOfExposed [

	<probe>
	^ (theIndividuals select: [ :each | each isExposed ]) size
]

{ #category : #probes }
REDModel >> numberOfInfectious [

	<probe>
	^ (theIndividuals select: [ :each | each isInfectious ]) size
]

{ #category : #probes }
REDModel >> numberOfRecovered [

	<probe>
	^ (theIndividuals select: [ :each | each isRecovered ]) size
]

{ #category : #probes }
REDModel >> numberOfSusceptible [

	<probe>
	^ (theIndividuals select: [ :each | each isSusceptible ]) size
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

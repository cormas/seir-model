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
REDModel class >> initialInfectionProbability [
	"The probability that an individual is initialized with infection"
	
	^ 0.001
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
		
	self
		createN: self class numberOfIndividuals
		randomlyLocatedAloneEntities: REDIndividual.
		
	self spreadInitialInfection.
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

{ #category : #'as yet unclassified' }
REDModel >> probesToCsv [

	| probeData rows |
	probeData := self data at: self class name.
	
	rows := (1 to: timeStep) asOrderedCollection collect: [ :i |
		probeData collect: [ :value |
			(value at: i) asString ] ].
	
	"Column names"
	rows addFirst: probeData keys.
	
	^ String cr join: (rows collect: [ :each | ',' join: each ])
]

{ #category : #'as yet unclassified' }
REDModel >> spreadInitialInfection [
	"Infect several individuals before running the simulation"
	| numberToInfect individualsToInfect |
	numberToInfect := self class initialInfectionProbability * self class numberOfIndividuals.
	
	numberToInfect > theIndividuals size ifTrue: [ 
		self error: 'Not enough individuals to spread the initial infection' ].
	
	individualsToInfect := Set new.
	
	[ individualsToInfect size < numberToInfect ] whileTrue: [ 
		individualsToInfect add: self theIndividuals atRandom ].
	
	individualsToInfect do: [ :each | each infect ].
	
	
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

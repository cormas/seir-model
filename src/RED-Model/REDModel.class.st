Class {
	#name : #REDModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theIndividuals',
		'theCells',
		'gridDimensions',
		'numberOfIndividuals',
		'initialInfectionProbability'
	],
	#category : #'RED-Model-Core'
}

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfExposed [
	<ignoreForCoverage>
	^ REDExposedState new color
]

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfInfectious [
	<ignoreForCoverage>
	^ REDInfectiousState new color
]

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfRecovered [
	<ignoreForCoverage>
	^ REDRecoveredState new color
]

{ #category : #'- probes' }
REDModel class >> colorOfProbe_numberOfSusceptible [
	<ignoreForCoverage>
	^ REDSusceptibleState new color
]

{ #category : #'default parameters' }
REDModel class >> defaultGridDimensions [

	^ 100 @ 100
]

{ #category : #'simulation settings' }
REDModel class >> defaultInit [

	^ #init
]

{ #category : #'default parameters' }
REDModel class >> defaultInitialInfectionProbability [
	"The probability that an individual is initialized with infection"
	
	^ 0.001
]

{ #category : #'default parameters' }
REDModel class >> defaultNumberOfIndividuals [

	^ 1000
]

{ #category : #accessing }
REDModel >> cellAt: rowNumber at: columnNumber [
	"A helper method for testing.
	Return the cell (i,j) from the rectangular spatial grid"
	
	| cells numberOfColumns |
	
	numberOfColumns := self spaceModel column.
	cells := self spaceModel spatialEntitiesAt: self class cellClass name.
	
	^ cells at: ((rowNumber - 1) * numberOfColumns + columnNumber).
	
]

{ #category : #accessing }
REDModel >> gridDimensions [

	^ gridDimensions
]

{ #category : #accessing }
REDModel >> gridDimensions: anObject [

	gridDimensions := anObject
]

{ #category : #init }
REDModel >> init [

	self
		createGridLines: gridDimensions x
		columns: gridDimensions y
		neighbourhood: 8
		closed: true.
		
	self
		createN: numberOfIndividuals
		randomlyLocatedEntities: REDIndividual.
		
	self spreadInitialInfection.
]

{ #category : #accessing }
REDModel >> initialInfectionProbability [

	^ initialInfectionProbability
]

{ #category : #accessing }
REDModel >> initialInfectionProbability: anObject [

	initialInfectionProbability := anObject
]

{ #category : #initialization }
REDModel >> initialize [

	super initialize.
	
	gridDimensions := self class defaultGridDimensions.
	numberOfIndividuals := self class defaultNumberOfIndividuals.
	initialInfectionProbability := self class defaultInitialInfectionProbability.
]

{ #category : #probes }
REDModel >> numberOfExposed [

	<probe>
	^ (theIndividuals select: [ :each | each isExposed ]) size
]

{ #category : #accessing }
REDModel >> numberOfIndividuals [

	^ numberOfIndividuals
]

{ #category : #accessing }
REDModel >> numberOfIndividuals: anObject [

	numberOfIndividuals := anObject
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

{ #category : #'export CSV' }
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

{ #category : #init }
REDModel >> spreadInitialInfection [
	"Infect several individuals before running the simulation"
	| numberToInfect individualsToInfect |
	numberToInfect := initialInfectionProbability * numberOfIndividuals.
	
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

{ #category : #accessing }
REDModel >> theCells [

	^ theCells ifNil: [ theCells := OrderedCollection new ].
]

{ #category : #accessing }
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

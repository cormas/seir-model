Class {
	#name : 'SEIRModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'theIndividuals',
		'theCells',
		'numberOfRows',
		'numberOfColumns',
		'numberOfIndividuals',
		'initialInfectionProbability'
	],
	#category : 'SEIR-Model-Core',
	#package : 'SEIR-Model',
	#tag : 'Core'
}

{ #category : '- probes' }
SEIRModel class >> colorOfProbe_numberOfExposed [
	<ignoreForCoverage>
	^ SEIRExposedState new color
]

{ #category : '- probes' }
SEIRModel class >> colorOfProbe_numberOfInfectious [
	<ignoreForCoverage>
	^ SEIRInfectiousState new color
]

{ #category : '- probes' }
SEIRModel class >> colorOfProbe_numberOfRecovered [
	<ignoreForCoverage>
	^ SEIRRecoveredState new color
]

{ #category : '- probes' }
SEIRModel class >> colorOfProbe_numberOfSusceptible [
	<ignoreForCoverage>
	^ SEIRSusceptibleState new color
]

{ #category : 'simulation settings' }
SEIRModel class >> defaultInit [

	^ #init
]

{ #category : 'default parameters' }
SEIRModel class >> defaultInitialInfectionProbability [
	"The probability that an individual is initialized with infection"
	
	^ 0.001
]

{ #category : 'default parameters' }
SEIRModel class >> defaultNumberOfColumns [

	^ 300
]

{ #category : 'default parameters' }
SEIRModel class >> defaultNumberOfIndividuals [

	^ 20000
]

{ #category : 'default parameters' }
SEIRModel class >> defaultNumberOfRows [

	^ 300
]

{ #category : 'simulation settings' }
SEIRModel class >> defaultProbes [

	^ self probes
]

{ #category : 'default parameters' }
SEIRModel class >> defaultRandomNumberGenerator [

	^ PMMitchellMooreGenerator new
]

{ #category : 'examples' }
SEIRModel class >> run2Replications [
	"Run 2 replications of simulation and save data to the CSV files"
	<example>
	| model dataPath file |
	
	dataPath := 'data' asFileReference ensureCreateDirectory.

	(1 to: 2) do: [ :i |
		model := self new.
		model initializeSimulation.
		
		(1 to: 730)
			do: [ :day | model runStep ]
			displayingProgress: [ :day | 'Day ', day asString ].
	
		file := dataPath / ('replication', i asString, '.csv').

		file writeStreamDo: [ :stream |
			stream nextPutAll: model probesToCsv ].
	
	] displayingProgress: [ :i | 'Running replication number ', i asString ].
]

{ #category : 'examples' }
SEIRModel class >> run30Replications [
	"Run 30 replications of simulation and save data to the CSV files"
	<example>
	| model file |

	(1 to: 30) do: [ :i |
		model := self new.
		model initializeSimulation.
		
		(1 to: 730)
			do: [ :day | model runStep ]
			displayingProgress: [ :day | 'Day ', day asString ].
	
		file := ('data/replication', i asString, '.csv') asFileReference.

		file writeStreamDo: [ :stream |
			stream nextPutAll: model probesToCsv ].
	
	] displayingProgress: [ :i | 'Running replication number ', i asString ].
]

{ #category : 'default parameters' }
SEIRModel class >> smallGridDimensions [

	^ 100 @ 100
]

{ #category : 'default parameters' }
SEIRModel class >> smallNumberOfIndividuals [

	^ 1000
]

{ #category : 'accessing' }
SEIRModel >> cellAt: rowNumber at: columnNumber [
	"A helper method for testing.
	Return the cell (i,j) from the rectangular spatial grid"
	
	| cells |
	cells := self spaceModel spatialEntitiesAt: self class cellClass name.
	
	^ cells at: ((rowNumber - 1) * numberOfColumns + columnNumber).
	
]

{ #category : 'init' }
SEIRModel >> init [

	self
		createGridLines: numberOfRows
		columns: numberOfColumns
		neighbourhood: 8
		closed: true.
		
	self
		createN: numberOfIndividuals
		randomlyLocatedEntities: SEIRIndividual.
		
	self spreadInitialInfection.
]

{ #category : 'init' }
SEIRModel >> initSmall [

	self numberOfIndividuals: self class smallNumberOfIndividuals.
	self gridDimensions: self class smallGridDimensions.

	self init.
]

{ #category : 'accessing' }
SEIRModel >> initialInfectionProbability [

	^ initialInfectionProbability
]

{ #category : 'accessing' }
SEIRModel >> initialInfectionProbability: anObject [

	initialInfectionProbability := anObject
]

{ #category : 'initialization' }
SEIRModel >> initialize [

	super initialize.
	
	theCells := OrderedCollection new.
	theIndividuals := OrderedCollection new.
	
	numberOfRows := self class defaultNumberOfRows.
	numberOfColumns := self class defaultNumberOfColumns.
	
	numberOfIndividuals := self class defaultNumberOfIndividuals.
	initialInfectionProbability := self class defaultInitialInfectionProbability.
	randomNumberGenerator := self class defaultRandomNumberGenerator.
]

{ #category : 'accessing' }
SEIRModel >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing' }
SEIRModel >> numberOfColumns: anObject [

	numberOfColumns := anObject
]

{ #category : 'probes' }
SEIRModel >> numberOfExposed [

	<probe>
	^ (theIndividuals select: [ :each | each isExposed ]) size
]

{ #category : 'accessing' }
SEIRModel >> numberOfIndividuals [

	^ numberOfIndividuals
]

{ #category : 'accessing' }
SEIRModel >> numberOfIndividuals: anObject [

	numberOfIndividuals := anObject
]

{ #category : 'probes' }
SEIRModel >> numberOfInfectious [

	<probe>
	^ (theIndividuals select: [ :each | each isInfectious ]) size
]

{ #category : 'probes' }
SEIRModel >> numberOfRecovered [

	<probe>
	^ (theIndividuals select: [ :each | each isRecovered ]) size
]

{ #category : 'accessing' }
SEIRModel >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing' }
SEIRModel >> numberOfRows: anObject [

	numberOfRows := anObject
]

{ #category : 'probes' }
SEIRModel >> numberOfSusceptible [

	<probe>
	^ (theIndividuals select: [ :each | each isSusceptible ]) size
]

{ #category : 'export CSV' }
SEIRModel >> probesToCsv [

	| probeData rows row |
	probeData := self data at: self class name.
	
	rows := (1 to: timeStep) asOrderedCollection collect: [ :i |
		row := #(numberOfSusceptible numberOfExposed numberOfInfectious numberOfRecovered)
			collect: [ :key | ((probeData at: key) at: i) asString ].
			
		row copyWithFirst: i asString ].
	
	"Column names"
	rows addFirst: #(TIME s e i r).
	
	^ String cr join: (rows collect: [ :each | ',' join: each ])
]

{ #category : 'accessing' }
SEIRModel >> randomNumberGenerator [

	^ randomNumberGenerator
]

{ #category : 'accessing' }
SEIRModel >> randomNumberGenerator: anObject [

	randomNumberGenerator := anObject
]

{ #category : 'utilities - random' }
SEIRModel >> randomSeed: aNumber [

	randomNumberGenerator := PMMitchellMooreGenerator seed: aNumber.
]

{ #category : 'initialization' }
SEIRModel >> spreadInitialInfection [
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

{ #category : 'control' }
SEIRModel >> step: anObject [

	self askRandom: SEIRIndividual toDo: #step
]

{ #category : 'accessing' }
SEIRModel >> theCells [

	<getterFor: #SEIRCell>
	^ theCells
]

{ #category : 'accessing' }
SEIRModel >> theIndividuals [

	<getterFor: #SEIRIndividual>
	^ theIndividuals
]

Class {
	#name : 'SEIRModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'theIndividuals',
		'theCells'
	],
	#classInstVars : [
		'numberOfRows',
		'numberOfColumns',
		'initialNumberOfIndividuals',
		'initialInfectionProbability'
	],
	#category : 'SEIR-Model-Core',
	#package : 'SEIR-Model',
	#tag : 'Core'
}

{ #category : 'accessing' }
SEIRModel class >> initialInfectionProbability [

	^ initialInfectionProbability
]

{ #category : 'accessing' }
SEIRModel class >> initialInfectionProbability: anObject [

	initialInfectionProbability := anObject
]

{ #category : 'accessing' }
SEIRModel class >> initialNumberOfIndividuals [

	^ initialNumberOfIndividuals
]

{ #category : 'accessing' }
SEIRModel class >> initialNumberOfIndividuals: anObject [

	initialNumberOfIndividuals := anObject
]

{ #category : 'initialization' }
SEIRModel class >> initializeParameters [

	super initializeParameters.
	numberOfRows := 100.
	numberOfColumns := 100.
	initialNumberOfIndividuals := 1000.
	initialInfectionProbability := 0.001.
]

{ #category : 'accessing' }
SEIRModel class >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing' }
SEIRModel class >> numberOfColumns: anObject [

	numberOfColumns := anObject
]

{ #category : 'accessing' }
SEIRModel class >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing' }
SEIRModel class >> numberOfRows: anObject [

	numberOfRows := anObject
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

{ #category : 'init' }
SEIRModel >> init [

	<init>
	self
		initializeNumberOfRows: self class numberOfRows
		numberOfColumns: self class numberOfColumns
		numberOfIndividuals: self class initialNumberOfIndividuals
]

{ #category : 'init' }
SEIRModel >> initFull [

	<init>
	self
		initializeNumberOfRows: 300
		numberOfColumns: 300
		numberOfIndividuals: 20000
]

{ #category : 'initialization' }
SEIRModel >> initialize [

	super initialize.
	
	theCells := OrderedCollection new.
	theIndividuals := OrderedCollection new.
]

{ #category : 'init' }
SEIRModel >> initializeNumberOfRows: aNumberOfRows numberOfColumns: aNumberOfColumns numberOfIndividuals: aNumberOfIndividuals [

	self
		createGridNumberOfRows: aNumberOfRows
		numberOfColumns: aNumberOfColumns
		neighbourhood: 8
		closed: true.
	
	self
		createN: aNumberOfIndividuals
		randomlyLocatedEntities: SEIRIndividual.

	self spreadInitialInfection.
]

{ #category : 'probes' }
SEIRModel >> numberOfExposed [

	<probeNamed: 'Number of exposed' color: ''>
	^ (theIndividuals select: [ :each | each isExposed ]) size
]

{ #category : 'probes' }
SEIRModel >> numberOfInfectious [

	<probeNamed: 'Number of infectious' color: ''>
	^ (theIndividuals select: [ :each | each isInfectious ]) size
]

{ #category : 'probes' }
SEIRModel >> numberOfRecovered [

	<probeNamed: 'Number of recovered' color: ''>
	^ (theIndividuals select: [ :each | each isRecovered ]) size
]

{ #category : 'probes' }
SEIRModel >> numberOfSusceptible [

	<probeNamed: 'Number of susceptible' color: ''>
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

{ #category : 'initialization' }
SEIRModel >> spreadInitialInfection [
	"Infect several individuals before running the simulation"
	| numberToInfect individualsToInfect |
	numberToInfect := self class initialInfectionProbability * self class initialNumberOfIndividuals.
	
	numberToInfect > theIndividuals size ifTrue: [ 
		self error: 'Not enough individuals to spread the initial infection' ].
	
	individualsToInfect := Set new.
	
	[ individualsToInfect size < numberToInfect ] whileTrue: [ 
		individualsToInfect add: self theIndividuals atRandom ].
	
	individualsToInfect do: [ :each | each infect ].
	
	
]

{ #category : 'control' }
SEIRModel >> step: anObject [

	<control>
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

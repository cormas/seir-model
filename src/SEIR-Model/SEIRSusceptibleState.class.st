Class {
	#name : 'SEIRSusceptibleState',
	#superclass : 'SEIRState',
	#category : 'SEIR-Model-Core',
	#package : 'SEIR-Model',
	#tag : 'Core'
}

{ #category : 'accessing' }
SEIRSusceptibleState >> color [

	^ Color gray
]

{ #category : 'testing' }
SEIRSusceptibleState >> isSusceptible [

	^ true
]

{ #category : 'instance creation' }
SEIRSusceptibleState >> newState [

	| rand |
	rand := individual random. 
	(individual colocatedEntity: individual class name verifying: [:a | a isInfectious]) ifNotNil: [  
	^ rand < individual infectionProbability
		ifTrue: [ SEIRExposedState forIndividual: individual ]
		ifFalse: [ self ]].
	^self
]

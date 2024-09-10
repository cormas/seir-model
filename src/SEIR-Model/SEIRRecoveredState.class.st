Class {
	#name : 'SEIRRecoveredState',
	#superclass : 'SEIRState',
	#category : 'SEIR-Model-State',
	#package : 'SEIR-Model',
	#tag : 'State'
}

{ #category : 'accessing' }
SEIRRecoveredState >> color [

	^ Color r: 0.19941348973607037 g: 0.6265884652981427 b: 0.17204301075268819 alpha: 1.0
]

{ #category : 'testing' }
SEIRRecoveredState >> isRecovered [

	^ true
]

{ #category : 'instance creation' }
SEIRRecoveredState >> newState [

	self incrementDayCount.
	
	^ dayCount >= individual immunityPeriod
		ifTrue: [ SEIRSusceptibleState forIndividual: individual ]
		ifFalse: [ self ]
]

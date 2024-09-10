Class {
	#name : 'SEIRExposedState',
	#superclass : 'SEIRState',
	#category : 'SEIR-Model-State',
	#package : 'SEIR-Model',
	#tag : 'State'
}

{ #category : 'accessing' }
SEIRExposedState >> color [

	^ Color r: 0.9442815249266863 g: 0.7683284457478006 b: 0.05865102639296188 alpha: 1.0
]

{ #category : 'testing' }
SEIRExposedState >> isExposed [

	^ true
]

{ #category : 'instance creation' }
SEIRExposedState >> newState [

	self incrementDayCount.
	
	^ dayCount >= individual incubationPeriod
		ifTrue: [ SEIRInfectiousState forIndividual: individual ]
		ifFalse: [ self ]
]

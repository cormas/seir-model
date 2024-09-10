Class {
	#name : 'SEIRInfectiousState',
	#superclass : 'SEIRState',
	#category : 'SEIR-Model-State',
	#package : 'SEIR-Model',
	#tag : 'State'
}

{ #category : 'accessing' }
SEIRInfectiousState >> color [

	^ Color r: 0.8895405669599218 g: 0.10166177908113393 b: 0.10948191593352884 alpha: 1.0
]

{ #category : 'testing' }
SEIRInfectiousState >> isInfectious [

	^ true
]

{ #category : 'instance creation' }
SEIRInfectiousState >> newState [

	self incrementDayCount.
	
	^ dayCount >= individual infectiousPeriod
		ifTrue: [ SEIRRecoveredState forIndividual: individual ]
		ifFalse: [ self ]
]

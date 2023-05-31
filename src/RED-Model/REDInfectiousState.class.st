Class {
	#name : #REDInfectiousState,
	#superclass : #REDState,
	#category : #'RED-Model-State'
}

{ #category : #accessing }
REDInfectiousState >> color [

	^ Color r: 0.8895405669599218 g: 0.10166177908113393 b: 0.10948191593352884 alpha: 1.0
]

{ #category : #testing }
REDInfectiousState >> isInfectious [

	^ true
]

{ #category : #'instance creation' }
REDInfectiousState >> newState [

	self incrementDayCount.
	
	^ dayCount >= individual infectiousPeriod
		ifTrue: [ REDRecoveredState forIndividual: individual ]
		ifFalse: [ self ]
]

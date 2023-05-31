Class {
	#name : #REDExposedState,
	#superclass : #REDState,
	#category : #'RED-Model-State'
}

{ #category : #accessing }
REDExposedState >> color [

	^ Color r: 0.9442815249266863 g: 0.7683284457478006 b: 0.05865102639296188 alpha: 1.0
]

{ #category : #testing }
REDExposedState >> isExposed [

	^ true
]

{ #category : #'instance creation' }
REDExposedState >> newState [

	self incrementDayCount.
	
	^ dayCount >= individual incubationPeriod
		ifTrue: [ REDInfectiousState forIndividual: individual ]
		ifFalse: [ self ]
]

Class {
	#name : #REDExposedState,
	#superclass : #REDState,
	#category : #'RED-Model-State'
}

{ #category : #accessing }
REDExposedState >> color [

	^ Color yellow
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

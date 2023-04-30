Class {
	#name : #REDInfectiousState,
	#superclass : #REDState,
	#category : #'RED-Model'
}

{ #category : #accessing }
REDInfectiousState >> color [

	^ Color red
]

{ #category : #testing }
REDInfectiousState >> isInfectious [

	^ true
]

{ #category : #'instance creation' }
REDInfectiousState >> newState [

	self incrementDayCount.
	
	dayCount >= individual infectiousPeriod
		ifTrue: [ REDRecoveredState forIndividual: individual ]
		ifFalse: [ self ]
]

Class {
	#name : #REDExposedState,
	#superclass : #REDState,
	#category : #'RED-Model'
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

	^ REDInfectiousState new
]

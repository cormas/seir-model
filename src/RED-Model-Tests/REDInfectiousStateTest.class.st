Class {
	#name : #REDInfectiousStateTest,
	#superclass : #REDStateTest,
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDInfectiousStateTest >> stateClass [

	^ REDInfectiousState
]

{ #category : #'as yet unclassified' }
REDInfectiousStateTest >> testIsInfectious [

	self assert: self state isInfectious 
]

{ #category : #tests }
REDInfectiousStateTest >> testNewState [

	(individual infectiousPeriod - 1) timesRepeat: [ 
		self assert: state newState isInfectious ].
	
	self assert: state newState isRecovered.

]

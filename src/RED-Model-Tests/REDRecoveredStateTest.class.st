Class {
	#name : #REDRecoveredStateTest,
	#superclass : #REDStateTest,
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDRecoveredStateTest >> stateClass [

	^ REDRecoveredState
]

{ #category : #'as yet unclassified' }
REDRecoveredStateTest >> testIsRecovered [

	self assert: self state isRecovered
]

{ #category : #tests }
REDRecoveredStateTest >> testNewState [

	(individual immunityPeriod - 1) timesRepeat: [ 
		self assert: state newState isRecovered ].
	
	self assert: state newState isSusceptible.

]

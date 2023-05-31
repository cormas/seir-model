Class {
	#name : #REDCellTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'cell'
	],
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDCellTest >> setUp [

	super setUp.
	cell := REDCell new.
]

{ #category : #tests }
REDCellTest >> testPov [ 
	
	self assert: (cell pov isKindOf: Color)
]

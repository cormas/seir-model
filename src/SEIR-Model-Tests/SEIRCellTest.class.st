Class {
	#name : #SEIRCellTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'cell'
	],
	#category : #'SEIR-Model-Tests'
}

{ #category : #initialization }
SEIRCellTest >> setUp [

	super setUp.
	cell := SEIRCell new.
]

{ #category : #tests }
SEIRCellTest >> testPov [ 
	
	self assert: (cell pov isKindOf: Color)
]

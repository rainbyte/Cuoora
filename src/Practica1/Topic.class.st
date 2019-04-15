Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description'
	],
	#category : #'Practica1-Core'
}

{ #category : #'as yet unclassified' }
Topic class >> withName: nombre [

	^self new _name: nombre; yourself 
]

{ #category : #'as yet unclassified' }
Topic class >> withName: nombre andDescription: descr [
	
	^self new _name: nombre; _description: descr; yourself 
]

{ #category : #'as yet unclassified' }
Topic >> _description: descr [

	description := descr
]

{ #category : #accessing }
Topic >> _name: eName [
	name := eName
]

{ #category : #accessing }
Topic >> description [
	^ description
]

{ #category : #initialization }
Topic >> initialize [
	super initialize.
	name := ''.
	description := ''.
]

{ #category : #accessing }
Topic >> name [
	^ name
]

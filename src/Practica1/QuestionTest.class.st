"
A QuestionTest is a test class for testing the behavior of Question
"
Class {
	#name : #QuestionTest,
	#superclass : #TestCase,
	#instVars : [
		'anUser',
		'aQuestion'
	],
	#category : #'Practica1-Tests'
}

{ #category : #running }
QuestionTest >> setUp [
	anUser := User withName: 'pepe' andPassword: 'qwerty'.
	aQuestion := Question withTitle: 'Que es StikoMagica?' andUser: anUser andRawTopics: 'foo,bar' andText: 'Me interesaria saber esto.'. 
]

{ #category : #tests }
QuestionTest >> testPreguntaTieneTopico [
	self assert:	(aQuestion hasTopic: (Topic withName: 'foo')) equals: true
]

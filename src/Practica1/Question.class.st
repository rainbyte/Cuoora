Class {
	#name : #Question,
	#superclass : #Object,
	#instVars : [
		'topics',
		'answers',
		'content'
	],
	#category : #'Practica1-Core'
}

{ #category : #accessing }
Question >> answers [
	^answers
]

{ #category : #testing }
Question >> isRelevantToUser: user [
	| hasTopic hasFollow |
	hasTopic := topics anySatisfy: [ :t | user topics includes: t ].
	hasFollow := user followList includes: (self user).
	^(hasTopic or: hasFollow)
]

{ #category : #accessing }
Question >> topics [
	^topics 
]

{ #category : #accessing }
Question >> user [
	^content user
]

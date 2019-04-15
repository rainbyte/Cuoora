Class {
	#name : #System,
	#superclass : #Object,
	#instVars : [
		'users',
		'questions'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Practica1-Core'
}

{ #category : #'as yet unclassified' }
System class >> getInstance [
	instance ifNil: [ self resetInstance ].
	^instance
]

{ #category : #initialization }
System class >> resetInstance [
	instance := self new
]

{ #category : #'as yet unclassified' }
System >> addQuestion: question [
	questions add: question
]

{ #category : #adding }
System >> addUser: aUser [
	users detect: [ :u | u name = aUser name ]
		ifNone: [
			users add: aUser. 
		]

]

{ #category : #'as yet unclassified' }
System >> deleteQuestion: question [
	questions remove: question
]

{ #category : #initialization }
System >> initialize [
	questions := Bag new.
	users := Set new.
]

{ #category : #'as yet unclassified' }
System >> loginWithUsername: aUsername andPassword: aPassword [
	users detect: [ :u | u name = aUsername and: u password = aPassword ] ifFound: [ :u | ^u ].
	^nil
]

{ #category : #'as yet unclassified' }
System >> obtainAnswersByUser: user [
	| byUser reduction |
	byUser := [ :answer | answer user = user ].
	reduction := [ :q :acc | acc addAll: (q answers select: byUser) ].
	^(questions inject: Bag new into: reduction)
	"user collect y flattened o mejor flatCollect.... y usar asBag, asSet para asegurarme"
]

{ #category : #'as yet unclassified' }
System >> obtainAnswersToQuestion: question [
	^question answers 
]

{ #category : #'as yet unclassified' }
System >> obtainQuestionsByTopic: topic [
	^questions select: [ :q | q topics contains: topic ]
]

{ #category : #'as yet unclassified' }
System >> obtainQuestionsByUser: user [
	^questions select: [ :q | q user = user ]
]

{ #category : #'as yet unclassified' }
System >> obtainQuestionsRelevantToUser: user [
	^(questions select: [ :q | q isRelevantToUser: user]) 
]

{ #category : #'as yet unclassified' }
System >> obtainQuestionsRelevantToUser: anUser sortedByDateTake: aNumber [
	| relevantQuestions howMany |
	relevantQuestions := self obtainQuestionsRelevantToUser: anUser.
	howMany := aNumber min: (relevantQuestions size).
	^((relevantQuestions sorted: [:x :y | x creation > y creation]) first: howMany)

]

{ #category : #'as yet unclassified' }
System >> obtainUsers [
	^users
]

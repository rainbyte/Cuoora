Class {
	#name : #System,
	#superclass : #Object,
	#instVars : [
		'users',
		'questions',
		'topics'
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

{ #category : #initialization }
System class >> resetInstanceToExample [
	| userPedro userDiego userJuan questionPedro questionDiego |
	
	self resetInstance.
	
	userPedro := User withName: 'pedro@cuoora.com' andPassword: 'pedro@cuoora.com'.
	userDiego := User withName: 'diego@cuoora.com' andPassword: 'diego@cuoora.com'.
	userJuan := User withName: 'juan@cuoora.com' andPassword: 'juan@cuoora.com'.
	
	questionPedro := Question withTitle: '¿Para qué sirve el método SetUp?' andUser: userPedro andRawTopics: 'OO1,Test de unidad' andText: ''.
	questionPedro addAnswer: (
		Answer withUser: userDiego
			andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.').
	
	questionDiego := Question withTitle: '¿Qué significa #messageNotUnderstood?' andUser: userDiego andRawTopics: 'OO1,Smalltalk' andText: ''.
	questionDiego addAnswer: (
		Answer withUser: userPedro
			andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.').
	
	instance addUser: userPedro; addUser: userDiego; addUser: userJuan; addQuestion: questionPedro; addQuestion: questionDiego.
]

{ #category : #'as yet unclassified' }
System >> addQuestion: question [
	questions add: question
]

{ #category : #adding }
System >> addTopic: aTopic [
	topics detect: [ :x | x name = aTopic name ] ifNone: [ topics add: aTopic ]
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
	topics := Bag new.
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
	reduction := [ :acc :q | acc addAll: (q answers select: byUser) ].
	^(questions inject: Bag new into: reduction)
	"user collect y flattened o mejor flatCollect.... y usar asBag, asSet para asegurarme"
]

{ #category : #'as yet unclassified' }
System >> obtainAnswersToQuestion: question [
	^question answers 
]

{ #category : #'as yet unclassified' }
System >> obtainQuestionsByTopic: topic [
	^questions select: [ :q | (q topics) anySatisfy: [ :topicName | topicName = topic name] ]
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

{ #category : #accessing }
System >> topics [
	^ topics
]

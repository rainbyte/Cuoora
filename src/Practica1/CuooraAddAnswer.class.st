Class {
	#name : #CuooraAddAnswer,
	#superclass : #WAComponent,
	#instVars : [
		'currentUser',
		'question',
		'answerText'
	],
	#category : #'Practica1-Web'
}

{ #category : #'as yet unclassified' }
CuooraAddAnswer class >> withCurrentUser: anUser toQuestion: aQuestion [
	^CuooraAddAnswer new currentUser: anUser; question: aQuestion; yourself
]

{ #category : #private }
CuooraAddAnswer >> answerText [
	^ answerText
]

{ #category : #private }
CuooraAddAnswer >> answerText: anObject [
	answerText := anObject
]

{ #category : #private }
CuooraAddAnswer >> currentUser: anUser [
	currentUser := anUser
]

{ #category : #private }
CuooraAddAnswer >> question: aQuestion [
	question := aQuestion
]

{ #category : #rendering }
CuooraAddAnswer >> renderContentOn: html [
	self renderHeaderOn: html.
	html horizontalRule.
	RenderingHelper renderQuestion: question viewByUser: currentUser inComponent: self usingBrush: html. 
	html horizontalRule.
	html form: [ 
		html text: 'Answer: '.
		html textInput on: #answerText of: self.
		html break.
		html submitButton
			callback: [ self call: (CuooraQuestion withCurrentUser: currentUser andQuestion: question) ];
			value: 'Cancel'.
		html submitButton
			callback: [
				question addAnswer: (Answer withUser: currentUser andText: answerText). 
				self call: (CuooraQuestion withCurrentUser: currentUser andQuestion: question)
			];
			value: 'Save'.
	]
]

{ #category : #private }
CuooraAddAnswer >> renderHeaderOn: html [
	RenderingHelper renderHeaderViewByUser: currentUser inComponent: self usingBrush: html
]

{ #category : #hooks }
CuooraAddAnswer >> style [
	^RenderingHelper style
]

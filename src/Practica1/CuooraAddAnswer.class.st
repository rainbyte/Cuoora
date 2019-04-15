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
	^CuooraAddAnswer new _currentUser: anUser; _question: aQuestion; yourself
]

{ #category : #accessing }
CuooraAddAnswer >> _answerText [
	^ answerText
]

{ #category : #accessing }
CuooraAddAnswer >> _answerText: anObject [
	answerText := anObject
]

{ #category : #accessing }
CuooraAddAnswer >> _currentUser: anUser [
	currentUser := anUser
]

{ #category : #'as yet unclassified' }
CuooraAddAnswer >> _question: aQuestion [
	question := aQuestion
]

{ #category : #'as yet unclassified' }
CuooraAddAnswer >> _renderHeaderOn: html [
	html div
		id: 'header';
		with: [
			html div
				id: 'header-left';
				with: [ html paragraph: 'CuOOra' ].
			html div
				id: 'header-right';
				with: [
					html paragraph: ('User "{1}"' format: {currentUser name}).
					html anchor
						callback: [ self call: (CuooraLogin new) ];
						with: 'Log out'.
				].
		]
]

{ #category : #rendering }
CuooraAddAnswer >> renderContentOn: html [
	self _renderHeaderOn: html.
	html horizontalRule.
	RenderingHelper renderQuestion: question viewByUser: currentUser inComponent: self usingBrush: html. 
	html horizontalRule.
	html form: [ 
		html text: 'Answer: '.
		html textInput on: #_answerText of: self.
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

{ #category : #hooks }
CuooraAddAnswer >> style [
	^RenderingHelper style
]

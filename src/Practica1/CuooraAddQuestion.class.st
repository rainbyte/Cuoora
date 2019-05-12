Class {
	#name : #CuooraAddQuestion,
	#superclass : #WAComponent,
	#instVars : [
		'_questionTitle',
		'_questionText',
		'_questionRawTopics',
		'currentUser'
	],
	#category : #'Practica1-Web'
}

{ #category : #'as yet unclassified' }
CuooraAddQuestion class >> withCurrentUser: anUser [
	^CuooraAddQuestion new currentUser: anUser; yourself
]

{ #category : #private }
CuooraAddQuestion >> currentUser: anUser [
	currentUser := anUser
]

{ #category : #private }
CuooraAddQuestion >> questionRawTopics [
	^ _questionRawTopics
]

{ #category : #private }
CuooraAddQuestion >> questionRawTopics: anObject [
	_questionRawTopics := anObject
]

{ #category : #private }
CuooraAddQuestion >> questionText [
	^ _questionText
]

{ #category : #private }
CuooraAddQuestion >> questionText: anObject [
	_questionText := anObject
]

{ #category : #private }
CuooraAddQuestion >> questionTitle [
	^ _questionTitle
]

{ #category : #private }
CuooraAddQuestion >> questionTitle: anObject [
	_questionTitle := anObject
]

{ #category : #rendering }
CuooraAddQuestion >> renderContentOn: html [
	self renderHeaderOn: html.
	html horizontalRule.
	html form: [
		html text: 'Title: '.
		html textInput on: #questionTitle of: self.
		html break.
		html text: 'Content: '.
		html textInput on: #questionText of: self.
		html break.
		html text: 'Topics: '.
		html textInput on: #questionRawTopics of: self.
		html break.
		html submitButton
			callback: [ self call: (CuooraHome withUser: currentUser) ];
			value: 'Cancel'.
		html submitButton
			callback: [
				| question |
				System getInstance registerMissingTopics: _questionRawTopics.
				question := Question
					withTitle: _questionTitle
					andUser: currentUser
					andRawTopics: _questionRawTopics
					andText: _questionText.
				System getInstance addQuestion: question.
				self call: (CuooraQuestion withCurrentUser: currentUser andQuestion: question)
			];
			value: 'Save'.
	]
	
]

{ #category : #private }
CuooraAddQuestion >> renderHeaderOn: html [
	RenderingHelper renderHeaderViewByUser: currentUser inComponent: self usingBrush: html 
]

{ #category : #hooks }
CuooraAddQuestion >> style [
	^RenderingHelper style
]

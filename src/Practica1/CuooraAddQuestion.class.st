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
	^CuooraAddQuestion new _currentUser: anUser; yourself
]

{ #category : #accessing }
CuooraAddQuestion >> _currentUser: anUser [
	currentUser := anUser
]

{ #category : #accessing }
CuooraAddQuestion >> _questionRawTopics [
	^ _questionRawTopics
]

{ #category : #accessing }
CuooraAddQuestion >> _questionRawTopics: anObject [
	_questionRawTopics := anObject
]

{ #category : #accessing }
CuooraAddQuestion >> _questionText [
	^ _questionText
]

{ #category : #accessing }
CuooraAddQuestion >> _questionText: anObject [
	_questionText := anObject
]

{ #category : #accessing }
CuooraAddQuestion >> _questionTitle [
	^ _questionTitle
]

{ #category : #accessing }
CuooraAddQuestion >> _questionTitle: anObject [
	_questionTitle := anObject
]

{ #category : #accessing }
CuooraAddQuestion >> _rawTopicsToTopics: rawTopics [
  ^(rawTopics = '') ifTrue: [ Bag new ] ifFalse: [ (rawTopics splitOn: ',') asBag ]
]

{ #category : #'as yet unclassified' }
CuooraAddQuestion >> _renderHeaderOn: html [
	RenderingHelper renderHeaderViewByUser: currentUser inComponent: self usingBrush: html 
]

{ #category : #rendering }
CuooraAddQuestion >> renderContentOn: html [
	self _renderHeaderOn: html.
	html horizontalRule.
	html form: [
		html text: 'Title: '.
		html textInput on: #_questionTitle of: self.
		html break.
		html text: 'Content: '.
		html textInput on: #_questionText of: self.
		html break.
		html text: 'Topics: '.
		html textInput on: #_questionRawTopics of: self.
		html break.
		html submitButton
			callback: [ self call: (CuooraHome withUser: currentUser) ];
			value: 'Cancel'.
		html submitButton
			callback: [
				| question |
				question := Question
					withTitle: _questionTitle
					andUser: currentUser
					andTopics: (self _rawTopicsToTopics: _questionRawTopics)
					andText: _questionText.
				System getInstance addQuestion: question.
				self call: (CuooraQuestion withCurrentUser: currentUser andQuestion: question)
			];
			value: 'Save'.
	]
	
]

{ #category : #hooks }
CuooraAddQuestion >> style [
	^RenderingHelper style
]

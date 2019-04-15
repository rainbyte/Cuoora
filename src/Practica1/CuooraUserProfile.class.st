Class {
	#name : #CuooraUserProfile,
	#superclass : #WAComponent,
	#instVars : [
		'currentUser',
		'profileUser'
	],
	#category : #'Practica1-Web'
}

{ #category : #'as yet unclassified' }
CuooraUserProfile class >> withCurrentUser: anUser andProfileUser: otherUser [
	^CuooraUserProfile new _currentUser: anUser; _profileUser: otherUser; yourself
]

{ #category : #accessing }
CuooraUserProfile >> _currentUser: anUser [
	currentUser := anUser
]

{ #category : #accessing }
CuooraUserProfile >> _profileUser: anUser [
	profileUser := anUser
]

{ #category : #rendering }
CuooraUserProfile >> renderContentOn: html [
	self renderHeader: html.
	html horizontalRule.
	self renderProfile: html.
]

{ #category : #rendering }
CuooraUserProfile >> renderHeader: html [
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
CuooraUserProfile >> renderProfile: html [
	html heading: ('Questions by {1}' format: {(profileUser name)}).
	html anchor
		callback: [ currentUser follow: profileUser ];
		with: ('Follow {1}' format: {(profileUser name)}).
	((System getInstance) obtainQuestionsByUser: profileUser)
		do: [ :question | RenderingHelper renderQuestion: question viewByUser: currentUser inComponent: self usingBrush: html ]

]

{ #category : #hooks }
CuooraUserProfile >> style [
	^	RenderingHelper style
]

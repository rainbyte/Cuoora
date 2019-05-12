"
A SystemTest is a test class for testing the behavior of System
"
Class {
	#name : #SystemTest,
	#superclass : #TestCase,
	#instVars : [
		'auxSys',
		'auxUser1',
		'auxUser2'
	],
	#category : #'Practica1-Tests'
}

{ #category : #running }
SystemTest >> setUp [
	auxSys := System new.	
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.

]

{ #category : #tests }
SystemTest >> testAgregarRespuesta [
	| auxPreg auxResp |

	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 0.
	auxResp := Answer withUser: auxUser2 andText: 'Sirve para ...'.
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 1.


]

{ #category : #tests }
SystemTest >> testAgregarUser [
	self assert: (auxSys obtainUsers size ) equals: 2. 


]

{ #category : #tests }
SystemTest >> testBorrarPregunta [
	| auxPreg auxResp |

	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg addAnswer: auxResp.
	auxSys deleteQuestion: auxPreg.
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 0
]

{ #category : #tests }
SystemTest >> testCrearTopico [
	auxSys addTopic: (Topic withName: 'OO1' andDescription: 'Objetos 1' ).
	auxSys addTopic: (Topic withName: 'OO1' andDescription: 'Objetos 1' ).
	auxSys addTopic: (Topic withName: 'TDD' andDescription: 'Test Driven Development' ).
	
	self assert: ((auxSys topics) size) equals: 2
]

{ #category : #tests }
SystemTest >> testLogin [
	self assert: (auxSys loginWithUsername: 'Pedro@cuoora.com'  andPassword: 'Pedro@cuoora.com') equals: auxUser1.
	self assert: (auxSys loginWithUsername: 'Diego@cuoora.com'  andPassword: 'Diego@cuoora.com') equals: auxUser2


]

{ #category : #tests }
SystemTest >> testLoginNotExists [
	self assert: (auxSys loginWithUsername: 'qwerty'  andPassword: 'qwerty') equals: nil.


]

{ #category : #tests }
SystemTest >> testPregunta [
	| auxPreg |

	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 1


]

{ #category : #tests }
SystemTest >> testPreguntasDeInteresPorSiguindo [
	| auxPreg1 auxPreg2 auxPreg3 |

	auxUser1 follow: auxUser2.
	auxPreg1 := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: 'AAA,BBB' andText: ''.
	auxSys addQuestion: auxPreg1.
	auxPreg2 := Question withTitle: '¿Qué significa x? ' andUser: auxUser2 andRawTopics: 'BBB,CCC' andText: ''.
	auxSys addQuestion: auxPreg2.
	auxPreg3 := Question withTitle: '¿Qué es un x? ' andUser: auxUser2 andRawTopics: 'CCC,DDD' andText: ''.
	auxSys addQuestion: auxPreg3.
	self assert: ((auxSys obtainQuestionsRelevantToUser: auxUser1) size) equals: 3.
]

{ #category : #tests }
SystemTest >> testPreguntasDeInteresPorTopico [
	| auxPreg1 auxPreg2 auxPreg3 |

	auxUser1 addInterestInTopic: 'BBB'. 
	auxPreg1 := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: 'AAA,BBB' andText: ''.
	auxSys addQuestion: auxPreg1.
	auxPreg2 := Question withTitle: '¿Qué significa x? ' andUser: auxUser2 andRawTopics: 'BBB,CCC' andText: ''.
	auxSys addQuestion: auxPreg2.
	auxPreg3 := Question withTitle: '¿Qué es un x? ' andUser: auxUser2 andRawTopics: 'CCC,DDD' andText: ''.
	auxSys addQuestion: auxPreg3.
	self assert: ((auxSys obtainQuestionsRelevantToUser: auxUser1) size) equals: 2.
]

{ #category : #tests }
SystemTest >> testPreguntasDeTopico [
	| auxPreg1 auxPreg2 auxPreg3 |

	auxUser1 follow: auxUser2.
	auxPreg1 := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: 'AAA,BBB' andText: ''.
	auxSys addQuestion: auxPreg1.
	auxPreg2 := Question withTitle: '¿Qué significa x? ' andUser: auxUser2 andRawTopics: 'BBB,CCC' andText: ''.
	auxSys addQuestion: auxPreg2.
	auxPreg3 := Question withTitle: '¿Qué es un x? ' andUser: auxUser2 andRawTopics: 'CCC,DDD' andText: ''.
	auxSys addQuestion: auxPreg3.
	self assert: ((auxSys obtainQuestionsByTopic: (Topic withName: 'BBB')) size) equals: 2.
]

{ #category : #tests }
SystemTest >> testPreguntasDeUsuario [
	| auxPreg auxResp |

	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 1.
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) includes: auxPreg) equals: true

]

{ #category : #tests }
SystemTest >> testRespuestaAPregunta [
	| auxPreg auxResp |

	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg  addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 1.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) includes: auxResp) equals: true.


]

{ #category : #tests }
SystemTest >> testRespuestaDeUsuario [
	| auxPreg auxResp |

	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1  andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg  addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersByUser: auxUser2) size) equals: 1


]

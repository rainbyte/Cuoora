"
A SystemTest is a test class for testing the behavior of System
"
Class {
	#name : #SystemTest,
	#superclass : #TestCase,
	#category : #'Practica1-Tests'
}

{ #category : #'as yet unclassified' }
SystemTest class >> cargarSistema [
| auxUser1 auxUser2 auxPreg auxResp auxRecs auxTopics|
auxTopics := Bag new add: (Topic ).
auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: auxTopics andText: ''.
auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.'.
auxPreg  addAnswer: auxResp.

]

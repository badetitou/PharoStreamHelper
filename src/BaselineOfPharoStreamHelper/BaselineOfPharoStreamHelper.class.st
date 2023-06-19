Class {
	#name : #BaselineOfPharoStreamHelper,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoStreamHelper
}

{ #category : #baselines }
BaselineOfPharoStreamHelper >> baseline: spec [
    <baseline>
    spec
    for: #common
    do: [ 
        self defineDependencies: spec.
        self definePackages: spec.
        self defineGroups: spec ]

]

{ #category : #baselines }
BaselineOfPharoStreamHelper >> defineDependencies: spec [

	
]

{ #category : #baselines }
BaselineOfPharoStreamHelper >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfPharoStreamHelper >> definePackages: spec [

	spec package: 'PharoStreamHelper'
]

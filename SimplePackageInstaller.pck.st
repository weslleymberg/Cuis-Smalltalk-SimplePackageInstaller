'From Cuis7.3 [latest update: #7088] on 24 March 2025 at 10:26:08 am'!
'Description '!
!provides: 'SimplePackageInstaller' 1 0!
SystemOrganization addCategory: #SimplePackageInstaller!


!classDefinition: #SimplePackageInstaller category: #SimplePackageInstaller!
Object subclass: #SimplePackageInstaller
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SimplePackageInstaller'!
!classDefinition: 'SimplePackageInstaller class' category: #SimplePackageInstaller!
SimplePackageInstaller class
	instanceVariableNames: ''!


!SimplePackageInstaller class methodsFor: 'package support' stamp: 'wbsl 3/24/2025 03:57:28'!
installPackage

	| pkgName |
	
	pkgName := self request: 'Please type a package name...' initialAnswer: ''.
	pkgName isEmpty ifTrue: [ ^ self ].
	
	[ Feature require: pkgName. ] 
		on: FeatureRequirementUnsatisfied
		do: [ :ex | self inform: ex description. ex return: nil.]! !

!SimplePackageInstaller class methodsFor: 'menu-world' stamp: 'wbsl 3/24/2025 10:07:15'!
worldMenuOptions
	^ `{{
			#submenuOf 				-> 	TheWorldMenu openLabel.
			#itemGroup 				-> 	20.
			#itemOrder 				-> 	10.
			#label 				-> 	'Install Package...'.
			#object 				-> 	SimplePackageInstaller.
			#selector 				-> 	#installPackage.
			#icon 				-> 	#packageIcon.
			#balloonText 				-> 	'Asks user for a package name to install'.
		} asDictionary}`! !

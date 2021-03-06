package org.uqbar.project.wollok.tests.quickfix

import org.junit.Test

class ConstructorsQuickFixTest extends AbstractWollokQuickFixTestCase {
	@Test
	def addOneConstructorsFromSuperclass(){
		val initial = #['''
			class MyClass{
				const y 
				constructor(x){
					y = x
				}
				
				method someMethod(){
					return null
				}
			}
			
			class MySubclass inherits MyClass {
				
			}
		''']

		val result = #['''
			class MyClass{
				const y 
				constructor(x){
					y = x
				}
				
				method someMethod(){
					return null
				}
			}
			
			class MySubclass inherits MyClass {
	
				constructor(x) = super(x)
			}
		''']
		assertQuickfix(initial, result, 'Add constructors from superclass')
	}

	@Test
	def addManyConstructorsFromSuperclass(){
		val initial = #['''
			class MyClass{
				const y 
				constructor(x){
					y = x
				}
				
				constructor(x,z){
					y = 1
				}
				
				method someMethod(){
					return null
				}
			}
			
			class MySubclass inherits MyClass {
				
			}
		''']

		val result = #['''
			class MyClass{
				const y 
				constructor(x){
					y = x
				}
				
				constructor(x,z){
					y = 1
				}
				
				method someMethod(){
					return null
				}
			}
			
			class MySubclass inherits MyClass {
	
				constructor(x) = super(x)

				constructor(x,z) = super(x,z)
			}
		''']
		assertQuickfix(initial, result, 'Add constructors from superclass')
	}

	@Test
	def createConstructorInSuperclass(){
		val initial = #['''
			class MyClass{
			}
			
			class MySubclass inherits MyClass {
				const y
				
				constructor(x) = super(x) {
					y = x
				}
			}
		''']

		val result = #['''
			class MyClass{
				constructor(param1){
					//TODO: Autogenerated Code ! 
				}
			}
			
			class MySubclass inherits MyClass {
				const y
				
				constructor(x) = super(x) {
					y = x
				}
			}
		''']
		assertQuickfix(initial, result, 'Create constructor in superclass')
	}

}
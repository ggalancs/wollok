package org.uqbar.project.wollok.codeGenerator.model.types.context

import org.uqbar.project.wollok.codeGenerator.model.types.Type

interface TypeContext {
	def Type typeForVariable(String name)
	def TypeContext getParentContext()
}
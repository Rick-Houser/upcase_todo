class TodosController < ApplicationController
	before_filter :authenticate

	def index
		@todos = Todo.where(email: current_email)
	end

	def new
		@todo = Todo.new
	end

	def create
		Todo.create(todo_params.merge(email: session[:current_email]))
		redirect_to todos_path
	end

	def todo_params
		params.require(:todo).permit(:title)
	end
end
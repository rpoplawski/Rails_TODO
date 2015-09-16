class TasksController < ApplicationController

  def index
    tasks = Task.all
    render json: tasks.to_json, status: 200
  end

  def new
    render json: Task.new
  end


  def show

    if Task.exists?(params[:id])
      tasks = Task.find(params[:id])
      render json: tasks.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end
end

#def create
#    #For create to work, we must *require* that a parameter is sent with the name 'message'
#    if params[:message].nil? || params[:message].empty?
#      err_msg = "The 'message' parameter was empty or not found"
#      render json: { error_msg: err_msg }.to_json, status: 422
#    else
#      # todo = Todo.create(message: params[:message])
#      todo = Todo.new
#      todo.message = params[:message]
#      todo.save
#      render json: todo.to_json, status: 201
#    end
#  end

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

  def create
    if params[:body].nil? || params[:body].empty?
      err_msg = "The 'message' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      # task = Task.create(body: params[:body]) => this is the same as the (3) lines below
      task = Task.new
      task.body = params[:body]
      task.save
      render json: task.to_json, status: 201
    end
  end

  def destroy
    if Task.exists?(params[:id])
      task = Task.find(params[:id])
      task.destroy
      render json: { message: "Task Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def update
    if Task.exists?(params[:id])  && (params[:completion_level] == true)
      task = ask.find(params[:id])
      task.message = params[:message]
      task.save
      render json: task.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

end


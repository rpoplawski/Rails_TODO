class TasksController < ApplicationController

  def index
    #render text: "params : #{params.inspect}"
    tasks = Task.all
    render json: tasks.to_json, status: 200
  end

  def new
    #render text: "params : #{params.inspect}"
    render json: Task.new
  end


  def show
    #render text: "params : #{params.inspect}"
    if Task.exists?(params[:id])
      tasks = Task.find(params[:id])
      render json: tasks.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    #render text: "params : #{params.inspect}"
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
    #render text: "params : #{params.inspect}"
    if Task.exists?(params[:id])
      task = Task.find(params[:id])
      task.destroy
      render json: { message: "Task Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def update
    #render text: "params : #{params.inspect}"
     if Task.exists?(params[:id])
      update_task_status = Task.update(params[:id], completed: params[:completion_level])

      render json: update_task_status, status: 200

    # if Task.exists?(params[:id]) && (params[:completion_level] == true)
    #    task = Task.find(params[:id])
    #   task.completion_level = params[:completion_level]
    #   task.save
    #   render json: task.to_json, status: 200
     else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
     end
  end
end


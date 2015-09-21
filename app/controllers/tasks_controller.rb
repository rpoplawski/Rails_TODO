class TasksController < ApplicationController

  def index
    #render text: "params : #{params.inspect}"
    tasks = Task.all
    respond_to do |f|
    f.html do
      render template: 'tasks/index.html.erb', locals: { tasks: tasks }
  end
    f.json do
      render json: tasks.to_json, status: 200
      end
    end
  end



  def show
    #render text: "params : #{params.inspect}"
    task = Tasks.find(params[:id])
    respond_to do |f|
    f.html do
      render template: 'tasks/show.html.erb', locals: { task: task }
    end
    f.json do
      render json: task.to_json, status: 200
    end
  end
end

  #def new
    #render text: "params : #{params.inspect}"
    #  render json: Task.new
    #end

  #def create
    #render text: "params : #{params.inspect}"
    #if params[:body].nil? || params[:body].empty?
    #  err_msg = "The 'message' parameter was empty or not found"
    #  render json: { error_msg: err_msg }.to_json, status: 422
    #else
      # task = Task.create(body: params[:body]) => this is the same as the (3) lines below
    #  task = Task.new
    #  task.body = params[:body]
    #  task.save
    #  render json: task.to_json, status: 201
   # end
 #end

 # def destroy
 #   #render text: "params : #{params.inspect}"
 #   if Task.exists?(params[:id])
 #     task = Task.find(params[:id])
 #     task.destroy
 #     render json: { message: "Task Deleted Successfully." }, status: 200
 #   else
 #     render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
 #   end
 # end

 # def update
    #render text: "params : #{params.inspect}"
 #     if Task.exists?(params[:id])
 #       update_task_status = Task.update(params[:id], completed: params[:completed])
 #       render json: update_task_status, status: 200
 #    else
 #     render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
 #    end
 # end



class TodosController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @todos = current_user.todos.recent
  end

  def show
  end

  def new
    @todo = current_user.todos.new
  end
  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: "タスク「#{@todo.name}」を登録しました。"
    else
      render :new
    end 
  end 
    

  def edit
  end
  def update
   
    @todo.update!(todo_params)
    redirect_to todos_url, notice: "タスク#{todo.name}を更新しました。"
  end 
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: "タスク#{todo.name}を削除しました。"
  end 
  
  
private
def todo_params
  params.require(:todo).permit(:name,:description)
end 
def set_task
  @todo = current_user.todos.find(params[:id])
end 
end

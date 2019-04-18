class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:destroy, :edit, :update]
    
    #def index
        #@tasks = Task.all.page(params[:page])
    #end
    
    #def show
        #@task = Task.find(params[:id])
    #end 
    
    #def new
        #@task = Task.new
    #end
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
          flash[:success] = 'タスクが保存されました'    
          redirect_to '/'
        else
          flash.now[:danger]= 'タスクが保存されませんでした'
          render :new
        end  
    end
    
    def edit
        
    end
    
    def update
        if @task.update(task_params)
            flash[:success]='タスクが更新されました'
            redirect_to '/'
        else  
            flash[:danger]='タスクが更新されませんでした'
            render :edit
        end    
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = 'タスクは削除されました'
        redirect_back(fallback_location: root_path)
    end 
    
private

  def task_params
      params.require(:task).permit(:content, :status)
  end    
  
  def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to root_url
      end
  end      
    
end

     

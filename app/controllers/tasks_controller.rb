class TasksController < ApplicationController
    def index
        @tasks = Task.all
        @task = Task.new
    end

    def new
      @task = tasks.build
    end

    def create
      @task = Task.new(task_params)

      respond_to do |format|
          if @task.save
          format.html { redirect_to tasks_url, notice: "tarefa salva!" }
          else
          format.html { redirect_to tasks_url, notice: "erro ao salvar tarefa."}
          end
      end
    end    
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_url, notice: "tarefa excluída!"
    end

  def toggle
      @task = Task.find(params[:id])
      @task.update(completed: params[:completed])
  
  end
    
    private

    def task_params
    params.require(:task).permit(:description, :subtype)
    end

end

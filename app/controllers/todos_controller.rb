class TodosController < ApplicationController
    def index
      @todos = Todo.all
    end

    def new
      @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
          flash[:notice]= "Se ha creado el objeto todo"
          redirect_to todo_path(@todo)
        else 
          render 'new'
        end
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        flash[:success] = 'Se ha guardado el todo'
        redirect_to todo_path(@todo)
      else
        flash[:danger] = 'No se ha podido modificar el todo'
        render :edit
      end
    end

    def destroy
      if @todo.destroy
        flash[:success] = 'Todo eliminado'
      else
        flash[:danger] = 'No se ha podido eliminar'
      end
      redirect_back(fallback_location: todos_path)
    end

    private

    def todo_params
      params.require(:todo).permit(:name, :description)
    end
end
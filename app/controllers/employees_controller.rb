class EmployeesController < ApplicationController

    def index 
        @employees = Employee.all 
     end
 
     def new 
         @employee = Employee.new
     end
 
     def create 
         @employee = Employee.new(employee_params)
         if @employee.valid?
             @employee.save
             redirect_to employee_path(@employee)
         else
             render :new
         end
     end
 
     def show 
         @employee = Employee.find(params[:id])
        end
 
     def edit 
         @employee = Employee.find(params[:id])
     end
 
     def update 
         @employee = Employee.find(params[:id])
         @employee.update(employee_params)
         if @employee.valid?
            redirect_to employee_path(@employee)
         else
             render :edit
         end
         
     end
 
     def delete 
         @employee = Employee.find(params[:id])
         @employee.destroy
         redirect_to employees_path
     end
 
     private
 
     def employee_params
         params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
     end

end

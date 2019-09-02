class DepartmentsController < ProtectForgeryApplication

  before_action  :authenticate_user!
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  before_action :create_enumaration, only: [:create, :update]

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.visible
    if params[:plan_id] || params[:enumeration_id]
      @departments = @departments.where(plan_id: params[:plan_id]  ) if params[:plan_id]
      if params[:enumeration_id]
        @departments = @departments.where(id: Principal.where(enumeration_id: params[:enumeration_id]).pluck(:object_id))
      end
      render 'all'
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def create_enumaration
    params[:department][:strategic_objectives_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless StrategicObjective.find_by_id(v['enumeration_id'])
        e = StrategicObjective.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:department][:strategic_objectives_attributes]

    params[:department][:customer_objectives_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless CustomerObjective.find_by_id(v['enumeration_id'])
        e = CustomerObjective.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:department][:customer_objectives_attributes]

    params[:department][:learning_growths_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless LearningGrowth.find_by_id(v['enumeration_id'])
        e = LearningGrowth.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:department][:learning_growths_attributes]

    params[:department][:internal_perspectives_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless InternalPerspective.find_by_id(v['enumeration_id'])
        e = InternalPerspective.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:department][:internal_perspectives_attributes]

  end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name, :plan_id, :organization_id, :is_locked, :strategic_description, :customer_description, :internal_description, :learning_description,
                                         strategic_objectives_attributes: [Principal.safe_attributes],
                                         customer_objectives_attributes: [Principal.safe_attributes],
                                         internal_perspectives_attributes: [Principal.safe_attributes],
                                         learning_growths_attributes: [Principal.safe_attributes],
                                         )
    end
end

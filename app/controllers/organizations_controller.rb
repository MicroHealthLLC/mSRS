class OrganizationsController < ProtectForgeryApplication

  before_action  :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :create_enumaration, only: [:create, :update]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    # @organization.strategic_objectives.build
    # @organization.customer_objectives.build
    # @organization.internal_perspectives.build
    # @organization.learning_growths.build
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def create_enumaration
    params[:organization][:strategic_objectives_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless StrategicObjective.find_by_id(v['enumeration_id'])
        e = StrategicObjective.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:organization][:strategic_objectives_attributes]


    params[:organization][:customer_objectives_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless CustomerObjective.find_by_id(v['enumeration_id'])
        e = CustomerObjective.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:organization][:customer_objectives_attributes]


    params[:organization][:learning_growths_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless LearningGrowth.find_by_id(v['enumeration_id'])
        e = LearningGrowth.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:organization][:learning_growths_attributes]

    params[:organization][:internal_perspectives_attributes].each do |k, v|
      next if v['enumeration_id'].blank?
      unless InternalPerspective.find_by_id(v['enumeration_id'])
        e = InternalPerspective.create(name: v['enumeration_id'], active: true)
        v['enumeration_id'] = e.id
      end
    end if params[:organization][:internal_perspectives_attributes]
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name, :plan_id, :is_locked, :strategic_description, :customer_description, :internal_description, :learning_description,
                                         strategic_objectives_attributes: [Principal.safe_attributes],
                                         customer_objectives_attributes: [Principal.safe_attributes],
                                         internal_perspectives_attributes: [Principal.safe_attributes],
                                         learning_growths_attributes: [Principal.safe_attributes],
                                         )
  end
end

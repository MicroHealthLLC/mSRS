class UsersController < ProtectForgeryApplication
  before_action  :authenticate_user!
  before_action :find_user, except: [:restore, :index, :active, :audit, :recently_connected]

  before_action :require_admin, only: [:add_department, :index, :destroy, :active]
  before_action :authorize, except: [:index, :destroy, :active, :search_users,
                                     :image_upload, :remove_image,
                                     :recently_connected]

  def recently_connected
    respond_to do |format|
      format.js{
        @recently_connected = User.
            recently_active.
            includes(:core_demographic).
            where.not(id: current_user.id )
      }
    end
  end

  def add_department
    @user.user_departments << UserDepartment.new(department_id: params[:department_id])
    redirect_back(fallback_location: user_path(@user))
  end

  def search_users
    q = params[:q]
    respond_to do |format|
      format.js{
        @recently_connected = User.
            where('login like ? OR email like ?', "#{q}%",  "#{q}%").
            includes(:core_demographic).
            where.not(id: current_user.id )
      }
    end
  end




  def image_upload
    @user.avatar = params[:images]
    @user.save(validate: false)
    render 'uploader/image_upload'
  end

  def remove_image
    @user.remove_avatar!
    @user.save
    render 'uploader/remove_image'
  end



  # authorized by admin
  def index
    respond_to do |format|
      format.pdf{}
      format.html{}
      format.json{
        options = Hash.new
        render json: UserDatatable.new(view_context,options)
      }
    end
  end

  def active
    if request.post?
      user = User.find params[:user_id]
      user.last_seen_at = 1.year.ago
      user.save
    end
    @users = User.where(state: true).
        includes(:core_demographic).
        references(:core_demographic)
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def destroy
    @user.destroy
    flash[:notice] = I18n.t('notice_successful_delete')
    redirect_to users_path
  end

  # authorized by manage roles





  def audit
    @users = User.includes(:core_demographic).
        references(:core_demographic)
  end

  def restore
    u = User.unscoped.find params[:id]
    u.restore
    u.save
    flash[:notice] = 'User restored'
    redirect_to users_path
  end

  def lock
    u = User.unscoped.find params[:id]
    u.failed_attempts = Setting['maximum_attempts'].to_i
    u.locked_at = Time.now
    u.save
    flash[:notice] = 'User locked'
    redirect_to users_path
  end

  def unlock
    u = User.unscoped.find params[:id]
    u.failed_attempts = 0
    u.locked_at = nil
    u.save
    flash[:notice] = 'User unlocked'
    redirect_to users_path
  end



  def show
    unless User.current_user.can?(:manage_roles)
      if @user != User.current
        render_403
      end
    end
    @profile       = @user.profile

  end

  def attachments
    @user.update(params.require(:user).permit(user_attachments_attributes: [Attachment.safe_attributes]))
    @user.save
    redirect_to user_path(@user)
  end


  def change_password
    if params[:user][:password] == params[:user][:password_confirmation]
      if @user.reset_password(params[:user][:password], params[:user][:password_confirmation])
        flash[:notice] = I18n.t('devise.passwords.updated_not_active')
      else
        flash[:error] = @user.errors.full_messages.join('<br/>')
      end

    else
      flash[:error] = 'Password not matched'
    end
    redirect_to user_path(@user)
  end


  def change_basic_info
    if @user.update(params.require(:user).permit(User.safe_attributes + [:admin]))
      flash[:notice] = I18n.t('notice_successful_update')
    else
      flash[:error] = I18n.t('error_update')
    end
    redirect_to user_path(@user)
  end

  def require_change_password
    @user.password_changed_at = 181.days.ago
    @user.save(validate: false)
    flash[:notice] = 'User require changing password next login'
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def authorize
    render_403 unless User.current.can?(:manage_roles)
  end
end

class MicropostsController < ApplicationController
    protect_from_forgery except: :show

    include TagsHelper
    before_action :logged_in_user, only: [:create, :destroy, :new]
    before_action :get_micropost, only: [:destroy, :edit, :show, :update]
    before_action :get_all_tags, only: [:edit, :new]
    before_action :valid_micropost_resource, only: [:destroy, :edit, :update]
    
    
    def create
        @active_ids = params[:active_tags]
        @micropost = current_user.microposts.build(micropost_params)
        add_tags(@active_ids, @micropost)
        if @micropost.save
            flash[:success] = "Пост создан"
            redirect_to microposts_path
        else
            render "microposts/index"
        end
    end

    def index 
        @microposts = Micropost.all
        @tags = Tag.all
    end

    def edit
        @micropost_tags = @micropost.tags
        @tags = elimination_exist_elems(@micropost_tags, @all_tags)
    end

    def new
        @micropost = current_user.microposts.build if logged_in?
        @tags = @all_tags
    end

    def show
        @some_micropost = Micropost.first
        @token = form_authenticity_token
        respond_to do |format|
          if @micropost_layer = @micropost
            format.html { redirect_to action: 'index', notice: 'Пост нашелся' }
            # format.js { render :js => alert("GGWP"), :json => @micropost_layer }
            format.js
            format.json { render json: @some_micropost, status: :ok }
          else
            format.html { redirect_to @microposts, notice: 'Нет такого поста' }  
            format.json { render json: @tag.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @active_ids = params[:active_tags]
        @inactive_ids = params[:inactive_tags]
        
        add_tags(@active_ids, @micropost)
        destroy_tags(@inactive_ids, @micropost)

        if @micropost.update_attributes(micropost_params)
          flash[:success] = "Пост обновлён" 
          redirect_to action: 'index'
        else
          render 'edit'
        end 
    end

    def destroy
        @micropost.destroy 

        respond_to do |format|
            format.html { redirect_to microposts_url }
            format.json { head :no_content }
        end
    end

    private 

        def get_micropost
            @micropost = Micropost.find(params[:id])
        end

        def micropost_params
            params.require(:micropost).permit(:content)
        end

        def valid_micropost_resource
            valid_resource(@micropost.user)
        end

        def get_all_tags
            @all_tags = Tag.all
        end
end

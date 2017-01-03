class PackagesController < ApplicationController
	before_action :find_package, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@packages = Package.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@packages = Package.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
		
	end

	def new
		@package = current_user.packages.build
		@categories = Category.all.map{|c| [c.name,c.id]}
	end

	def create
		@package = current_user.packages.build(package_params)
		@package.category_id = params[:category_id]
		if @package.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{|c| [c.name,c.id]}
	end

	def update
		if @package.update(package_params)
			redirect_to package_path(@package)
		else
			render 'edit'
		end
	end

	def destroy
		@package.destroy
		redirect_to packages_path
	end

	private
	def package_params
		params.require(:package).permit(:title, :description, :price, :validity, :category_id, :package_img)
	end

	def find_package
		@package = Package.find(params[:id])		
	end
end

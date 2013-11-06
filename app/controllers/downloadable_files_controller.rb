class DownloadableFilesController < ApplicationController
  
  def new
    if !current_user.admin_user
      redirect_to downloadable_files_path
    end
    @file = DownloadableFile.new
  end
  
  def create
    if !current_user.admin_user
      redirect_to root_url
    else 
      if @file.save 
        flash[:success] = "File uploaded created"
        redirect_to files_path
      end   
    end
  end
  
  def edit
  end
  
  def destroy
  end
  
  def show
    @file = DownloadableFile.find(params[:id])
  end
  
  def index
    @files = DownloadableFile.paginate(page: params[:page], per_page: 20)
  end

private
  
    def downloadable_file_params
      params.require(:downloadable_file).permit(:name, :display_name, :the_file)
    end
end

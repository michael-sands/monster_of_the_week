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
      @file = DownloadableFile.create(downloadable_file_params)
      @file.the_file = params[:downloadable_file][:the_file]
      if @file.save!
        flash[:success] = "File uploaded"
        redirect_to downloadable_files_path
      else 
        flash[:error] = "WTF "
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
      params.require(:downloadable_file).permit(:name, :display_name, :the_file, :public)
    end
end

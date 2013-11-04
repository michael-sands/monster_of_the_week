class DownloadableFilesController < ApplicationController
  
  def downloads
  end
  
  def new
    @file = DownloadableFile.new
  end
  
  def edit
  end
  
  def destroy
  end
  
  def show
    @file = DownloadableFile.find(params[:id])
  end

end

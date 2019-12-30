class LabelsController < ApplicationController
  def get_label_list
    @tags = Label.all
    respond_to do |format|
      format.json do
        render json: { data: { tags: @tags },
                       statusCode: 200,
                       statusMessage: 'Successfully Extracted Tags',
                       success: true,
                       error: {} }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_label
    @tag = Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def label_params
    params.require(:label).permit(:name)
  end
end
class PropertyTypesController < ApplicationController
  before_action :set_property_type, only: [:show]

  def show; end

  def new
    @property_type = PropertyType.new
  end

  def create
    @property_type = PropertyType.new(property_type_params)
    if @property_type.save
      flash[:success] = 'Tipo do imóvel cadastrado com sucesso'
      redirect_to @property_type
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  private

  def property_type_params
    params.require(:property_type).permit(:name)
  end

  def set_property_type
    @property_type = PropertyType.find(params[:id])
  end
end

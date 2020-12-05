class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def new
    @cocktails = Cocktail.all
    @pedido = Pedido.new
  end

  def create
    @pedido = Pedido.new
    @cocktail = params[:cocktail_id]
    @pedido.cocktail_id = @cocktail

    if @pedido.save
      redirect_to pedidos_path, notice: "Pedido nº #{@pedido.id} foi criado para a mesa #{@pedido.mesa}."
    else
      render :new
    end
  end

  def pedido_params
    params.require(:pedido).permit(:mesa, :cocktail, :quantidade)
  end
end

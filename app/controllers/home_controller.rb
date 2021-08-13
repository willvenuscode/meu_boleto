class HomeController < ApplicationController
  def index
  end

  def criar_boleto
  input = {
    customer_person_name: params[:customer_person_name],
    customer_cnpj_cpf: params[:customer_cnpj_cpf],
    customer_zipcode: params[:customer_zipcode],
    expire_at: params[:expire_at],
    customer_address: params[:customer_address],
    customer_neighborhood: params[:customer_neighborhood],
    customer_city_name: params[:customer_city_name],
    customer_state: params[:customer_state],
    amount: params[:amount],
    description: params[:description]
    }
  
    result = BoletoSimples::BankBillet.create(input)
    if result.persisted?
      redirect_to "https://sandbox.boletosimples.com.br/boletos/#{result.id}"
    else
      redirect_to home_index_path, flash[:alert] = result.response_errors
    end
  end
end

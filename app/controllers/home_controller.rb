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
      att = {remote_id: result.id, status: result.status}
      billet = Billet.create(att)

      if billet.valid?
        redirect_to result.attributes.dig(:formats, :pdf)
      else
        redirect_to home_index_path, alert: billet.errors.full_messages
      end
    else
      redirect_to home_index_path, alert: result.response_errors
    end
  end
end

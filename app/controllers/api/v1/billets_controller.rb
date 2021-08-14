class Api::V1::BilletsController < ApiController
  def payment
    billet = Billet.find_by(remote_id: params.dig(:object, :id))
    if billet.update(status: params.dig(:object, :status))
      render json: {}, status: :ok
    else
      render json: {error: billet.errors.full_messages}
    end
  end
end
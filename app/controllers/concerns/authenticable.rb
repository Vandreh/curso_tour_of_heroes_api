#
module Authenticable
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']

    unless valid_token?
      # render json: { errors: 'Você não tem autorização para essa operação.'},
      render json: { errors: 'Forneça um header Authorization para se identificar (Qualquer um com pelo menos 10 caracteres).'},
             status: :unauthorized
    end
  end

  def valid_token?
    # @token.present? && @token == Rails.application.credentials.token
    @token.present? && @token.size >= 10
  end
end

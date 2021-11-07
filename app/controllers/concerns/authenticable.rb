#
module Authenticable
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']

    unless valid_token?
      # render json: { errors: 'Você não tem autorização para essa operação.'},
      render json: { errors: 'Provide an Authorization header to identify yourself (Any at least 10 characters long)' },
             status: :unauthorized
    end
  end

  def valid_token?
    # @token.present? && @token == Rails.application.credentials.token
    @token.present? && @token.size >= 10
  end
end

class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])
    Transaction.create!(
      notification_code: params[:notificationCode],
      params: params,
      errors: transation.errors,
      transaction: transaction
    )

    render nothing: true, status: 200
  end
end

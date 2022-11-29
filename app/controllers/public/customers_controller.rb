class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_my_page_path
  end

  # def unsubscribe
  # end

  # 顧客の退会処理(ステータスの更新)
  def withdraw
    current_customer.update(is_deleted: true)
    # sessionの削除
    reset_session
    redirect_to new_customer_session_path, notice: "退会処理が完了しました。"
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :encrypted_password, :email)
    end

end

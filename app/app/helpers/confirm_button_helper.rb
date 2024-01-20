# frozen_string_literal: true

module ConfirmButtonHelper
  DEFAULT_CONFIRM_MESSAGE = '本当によろしいですか？'

  # このメソッドは、StimulusのConfirmButtonController向けにdata属性を構成します。
  def data_for_confirm(confirm_message: DEFAULT_CONFIRM_MESSAGE)
    {
      controller: 'confirm-button',
      action: 'confirm-button#show',
      'confirm-button-message': confirm_message
    }
  end
end

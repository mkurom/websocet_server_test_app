Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  # root(/)のURLを指定
  # to: controller, actionの短縮形
  # rooms#show -> rooms_controller.rbのshowメソッド
  root to: 'rooms#show'

  get 'rooms/show'
end

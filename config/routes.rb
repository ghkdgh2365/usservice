Rails.application.routes.draw do
  get 'reply/show'

  post '/reply/create/:board_id'=>"reply#create"

  get 'reply/delete'

  get 'reply/update'

  get 'reply/edit'

  get 'reply/new'

  root 'home#index'
  get 'home/index'
  get 'receipts/show_receipts/:user_id' => 'receipts#show_receipts'
  get 'home/search_receipts'
  get 'home/new_ask'
  post 'home/create_ask'
<<<<<<< HEAD
  get 'boards/search_group' # 학생회 게시판 찾을 때
  get 'boards/show_group' # 대학 학생회 게시판 목록 보여줄 때
  get 'boards/group/:user_id' => 'boards#group'
=======
  get 'home/admin'
  get 'boards/search_group' # 학생회 게시판 찾을 때
  get 'boards/show_group' # 대학 학생회 게시판 목록 보여줄 때
  get 'boards/group/:user_id' => 'boards#group', as: "show_group_board_yap"
>>>>>>> 55135ee90fc17597fd5cd83c3207538cfec3aa89
  get 'boards/new/:group_code' => 'boards#new', as: "new_board_group"
  # post 'receipts/create_comment/:post_id' => 'receipts#create_comment'
  resources :boards
  resources :receipts
  resources :cards
  post 'cards/data' => 'cards#cardData'
  devise_for :users
  
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
        post 'sessions/verify' => 'sessions#verify_token', :as => 'send'
      end
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

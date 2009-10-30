ActionController::Routing::Routes.draw do |map|

  map.resources :users, :collection=>{:check_user_name=>:post, :check_user_email=>:post}
  map.welcome '/welcome', :controller=>'users', :action=>'welcome'
  map.signup '/signup', :controller => 'users', :action => 'new'

  map.resources :photos

  map.resource :session
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.root    :controller => 'forums', :action => 'index'

	map.namespace :manager do |manager|
		 # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)  
		manager.resources :forums, :collection=>{:new_forum=>:get}
	end

	map.namespace :jia do |jia|
		 # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)  
		jia.resources :welcome
    jia.resources :account, :collection=>{:change_photo=>:get, :upload_photo=>:post,
                                          :detail=>:get,
                                          :content=>:get,
                                          :change_password=>:get,
                                          :choose_skin=>:get}
    jia.resources :talk, :collection=>{:my_talk=>:get, :our_talk=>:get}
    jia.resources :topic, :collection=>{:my_topics=>:get,
                                        :my_posts=>:get,
                                        :my_rates=>:get,
                                        :my_favorites=>:get}
	end

  map.resources :forums, :member=>{:find_tags=>:get} do |forum|
    forum.resources :topics, :collection=>{:add_photo=>:post} do |topic|
      topic.resources :posts
    end
  end

#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
end

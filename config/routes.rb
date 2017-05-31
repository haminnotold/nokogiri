Rails.application.routes.draw do
   root 'anam#index'
   get '/get_anam' => 'anam#get_anam'

end

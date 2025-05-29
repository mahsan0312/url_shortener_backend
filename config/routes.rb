Rails.application.routes.draw do
  post "/shorten", to: "links#create"
  get "/:slug", to: "links#show"
end

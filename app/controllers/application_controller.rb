class ApplicationController < ActionController::Base
  <% if Rails.env.production? %>
    <%= render 'layouts/google_analytics' %>
  <% end %>
end

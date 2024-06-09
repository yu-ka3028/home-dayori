class StaticPagesController < ApplicationController
    skip_before_action :require_login, only: %i[top] #Topページはログイン不要（application_controller.rbで設定したbefore_actionをスキップする）
    def top 
    end
end

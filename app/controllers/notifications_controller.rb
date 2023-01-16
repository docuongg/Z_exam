class NotificationsController < ApplicationController
    def index
        # @notifications = current_user.notifications.all.paginate(page: params[:page], per_page: 5)   
    end
end
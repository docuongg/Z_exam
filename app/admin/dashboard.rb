# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end 

  controller do
    def index
      if filter_date_params.present?
        @from_date = params[:from]
        @to_date = params[:to]
      else
        @from_date = 1.weeks.ago
        @to_date = Time.now
      end
      render 'admin/dashboard/index', :layout =>"active_admin"
    end

    private

    def filter_date_params
      params.permit(:from, :to)
    end
  end
end

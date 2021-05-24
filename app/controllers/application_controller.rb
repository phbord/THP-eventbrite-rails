class ApplicationController < ActionController::Base
    include UsersHelper
    include EventsHelper
    include AdminHelper
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected
    def render_json(json, options={})
      callback, variable = params[:callback], params[:variable]
      response = begin
        if callback && variable
          "var #{variable} = #{json};\n#{callback}(#{variable});"
        elsif variable
          "var #{variable} = #{json};"
        elsif callback
          "#{callback}({'results':#{json}});"
        else
          json
        end
      end
      render({:content_type => :js, :text => response}.merge(options))
    end
  
end

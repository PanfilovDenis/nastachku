class Web::LectorsController < Web::ApplicationController
  def index
    @lectors = User.activated.as_lectors.visible.by_created_at.ransack(params).result(distinct: true)
    @workshops = Workshop.web
  end
end

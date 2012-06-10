class StaticPagesController < ApplicationController
  def home
    @news = Post.all(limit: 3)
    @partner = random_partner
  end

  private
  
    def random_partner
      ps = Partner.find_all_by_active(true)
      unless ps.nil?
        ot = rand(ps.count)
        p = ps[ot]
      end
    end
end

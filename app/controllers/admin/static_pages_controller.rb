# -*- coding: utf-8 -*-
class Admin::StaticPagesController < Admin::AdminController
  before_filter :signed_in_user

  def show
  end
end

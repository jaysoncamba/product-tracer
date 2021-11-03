class CriteriaController < ApplicationController
  get '/' do
    @criteria = Criteria.all
    haml :"criteria/index"
  end

  get '/new' do
    @criteria = CriteriaManager.build_with_default_rules
    haml :"criteria/new"
  end

  post '/' do
    @criteria =  CriteriaManager.new(params).update_or_create
    redirect to "/#{@criteria.id}"
  end

  get '/:id/edit' do
    @criteria = Criteria.joins(:rules).find params[:id]
    haml :"criteria/edit"
  end

  get '/:id/destroy' do
    Criteria.destroy params[:id]
    redirect to "/"
  end

  get '/:id' do
    @criteria = Criteria.joins(:rules).find params[:id]
    haml :"criteria/show"
  end
end
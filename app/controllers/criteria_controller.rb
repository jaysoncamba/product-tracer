class CriteriaController < ApplicationController
  get '/' do
    haml :"criteria/index"
  end
end
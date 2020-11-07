class BooksController < ApplicationController
  def search
    if params[:content]
      @books = RakutenWebService::Ichiba::Item.search(keyword: params[:content])
    end
  end
end

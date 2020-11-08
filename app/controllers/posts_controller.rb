class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @shelves = Shelf.where(user_id: @current_user.id)
    @shelves_read = Shelf.where(user_id: @current_user.id,status: false).
                    order(created_at: :asc).first(20).sample(4)
    today = Date.today
    @ever_finish = Shelf.where(user_id: @current_user.id,status: true).count
    @today_month_finish = Shelf.finish_on_between(today.beginning_of_month,nil).count
    @today_year_finish = Shelf.finish_on_between(today.beginning_of_year,nil).count

  end
  def search
    @shelf = Shelf.new
    if params[:content].present?
      @books = RakutenWebService::Books::Book.search(title: params[:content])
    else
      render("/posts/search")
    end
  end

  def create
    if params[:book_image].nil?
      params[:book_image] = "/shelf_images/default1.png"
    end
    @shelf = Shelf.new(
      title: params[:book_name],
      author: params[:book_author],
      user_id: @current_user.id,
      image_url:params[:book_image]
    )
    if @shelf.save
      flash[:notice] = "追加しました"
      redirect_to("/posts/index")
    else
      render("posts/search")
    end
  end

  def shelf
    @shelves = Shelf.where(user_id: @current_user.id).all.order(created_at: :desc)
  end

  def shelfnow
    @shelves = Shelf.find_by(status: false)
    redirect_to("/posts/shelf")
  end

  def show
    @shelf = Shelf.find_by(id: params[:id])
  end

  def comment
    shelf = Shelf.find_by(id: params[:id])
    puts params[:id]
    if params[:finish]
      shelf.content = params[:content]
      shelf.status = true
      shelf.finish_on = Date.today
    elsif params[:update]
      shelf.content = params[:content]
    elsif params[:cancel]
      shelf.content = nil
      shelf.status = false
      shelf.finish_on = nil
    elsif params[:destroy]
      shelf.destroy
    end

    if shelf.save
      flash[:notice] = "変更しました"
      redirect_to("/posts/index")
    else
        if params[:destroy]
          redirect_to("/posts/shelf")
        else
          render("posts/show/#{params[:id]}")
        end
    end

  end
end

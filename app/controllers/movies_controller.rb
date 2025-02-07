class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def search
    if params[:q].present?
      omdb_service = OmdbService.new
      search_results = omdb_service.search_movies(params[:q])
      @movies = search_results['Search'] || []
    else
      @movies = Movie.all
    end
    render :index
  end

  def new
    @movie = Movie.new
  end

  def create
    omdb_service = OmdbService.new
    movie_details = omdb_service.get_movie_details(params[:imdb_id])

    @movie = Movie.new(
      title: movie_details['Title'],
      year: movie_details['Year'],
      genre: movie_details['Genre'],
      director: movie_details['Director'],
      plot: movie_details['Plot']
    )

    if @movie.save
      redirect_to root_path, notice: 'Filme adicionado com sucesso!'
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'Comentário atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path, notice: 'Filme removido dos favoritos!'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :director, :plot, :comment)
  end
end

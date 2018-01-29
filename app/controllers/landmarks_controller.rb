class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])

    if !params[:figure][:name].empty?
      landmark.figures << Figure.create(params[:figure])
    end
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])

    if !params[:figure][:name].empty?
      landmark.figures << Figure.create(params[:figure])
    end
    redirect "/landmarks/#{landmark.id}"
  end
end

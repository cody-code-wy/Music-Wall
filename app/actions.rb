# Homepage (Root path)
get '/' do
  erb :index
end

get '/submit/song/new' do
  erb :'submit/new-song.html'
end

post '/submit/song/new' do
  song = Song.create(
    title: params[:title],
    author: params[:author],
    url: params[:url]
  )
  redirect "/songs/#{song.id}"
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index.html'
end

get '/songs/:id' do |id|
  @song = Song.find(id)
  erb :'songs/show.html'
end

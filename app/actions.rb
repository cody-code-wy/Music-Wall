# Homepage (Root path)

get '/debug' do
  status.inspect
end

get '/' do
  erb :index
end

get '/signup' do
  erb :'signup.html'
end

post '/signup' do
  member = Member.create(username: params[:uname], password: params[:password])
  session[:username] = member.username if member.id
  redirect '/'
end

get '/login' do
  erb :'login.html'
end

post '/login' do
  member = Member.where(username: params[:uname]).first
  if member && member.password == params[:password]
    session[:username] = member.username
  end
  redirect '/'
end

get '/logout' do
  session[:username] = nil
  redirect '/'
end

post '/submit/upvote' do
  Song.find(params[:song]).upvotes.create(member: Member.where(username: session[:username])[0])
  redirect "/songs/#{params[:song]}"
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
  @songs = Song.all.joins("LEFT JOIN 'upvotes' on upvotes.song_id = songs.id").group("songs.id").order("count(member_id) DESC")
  erb :'songs/index.html'
end

get '/songs/:id' do |id|
  @song = Song.find(id)
  erb :'songs/show.html'
end

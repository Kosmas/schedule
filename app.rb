require 'bundler'
Bundler.require

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/schedule.db")

class Entry
  include DataMapper::Resource

  property :id, String, length: 20, key: true
  property :title, String, length: 255

  belongs_to :initiator
end

class Initiator
  include DataMapper::Resource

  property :notify, Boolean
  property :email, String, key: true
  property :name, String, length: 80

  has n, :entries
end

DataMapper.finalize

Entry.auto_upgrade!
Initiator.auto_upgrade!

post '/entries' do
  content_type :json

  params_json = JSON.parse(request.body.read)

  @entry = Entry.new(params_json)

  if @entry.save
    @entry.to_json
  else
    halt 500
  end
end

get '/entries/:id' do
  content_type :json

  @entry = Entry.get(params[:id])

  if @entry
    {
      "id": @entry.id,
      "title": @entry.title,
      "initiator": {
                    "notify": @entry.initiator.notify,
                    "email": @entry.initiator.email,
                    "name": @entry.initiator.name
                   }
    }.to_json
  else
    halt 404
  end
end

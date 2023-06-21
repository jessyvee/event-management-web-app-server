class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "This is home"
  end

  # this works, just testing out the search end point
  # get "/events" do
  #   Event.all.to_json
  # end

  get "/events" do
    Event.all.to_json
  end
  
  get "/events/:id" do
    Event.find(params[:id]).to_json
  end

  # Route to be used for the search feature
  get '/events' do
    name = params[:name]
    description = params[:description]
    events = Event.all

  # Filtering events based on name and/or description
    filtered_events = events.select do |event|
      (name.nil? || event[:name].downcase.include?(name.downcase)) &&
        (description.nil? || event[:description].downcase.include?(description.downcase))
    end

    # Returning the filtered events as JSON
    filtered_events.to_json
    end

  get "/attendees" do
    Attendee.all.to_json
  end

  get "/attendees/:id" do
    attendee= Attendee.find(params[:id])
    attendee.to_json
  end

  get "/subscribers" do
    Subscriber.all.to_json
  end

  
  get "/newsletters" do
    Newsletter.all.to_json
  end

  delete "/attendees/:id" do
    attendee = Attendee.find(params[:id])
    attendee.destroy
    attendee.to_json
  end

  post '/attendees/create' do
    request_body = JSON.parse(request.body.read)
    
    new_attendee = Attendee.create(
      name: request_body['attendeeName'],
      email: request_body['attendeeEmail']
    )
    
    if new_attendee.valid?
      new_attendee.to_json
    else
      halt 400, new_attendee.errors.to_json
    end
  end
  

  post '/events' do
    new_event = Event.create(
      name:params[:name],
      date:params[:date],
      category:params[:category],
      description:params[:description],
      image:params[:image]
    )
    new_event.to_json
  end 

  post '/subscribers/create' do
    new_subscriber = Subscriber.create(
      name: params[:name],
      email: params[:email],
      category: params[:category]
    )
  
    if new_subscriber.valid?
      status 201
      new_subscriber.to_json
    else
      status 400
      { error: 'Failed to create subscriber' }.to_json
    end
  end
  

  
end

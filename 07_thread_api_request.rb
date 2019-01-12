require 'sinatra'
require 'httparty'

get '/fast_response' do
  start_time = Time.now
  token = ENV["GITHUB_API_TOKEN"]
  repos = JSON.parse(IO.read("data/repos.json"))
  
  res = repos.map do |repo|
    # Create a separate thread for each API request 
    Thread.new do
      owner, repo = repo.split("/")

      response = HTTParty.get(
        "https://api.github.com/repos/#{owner}/#{repo}",
        headers: {
          "Authorization" => "Bearer #{token}",
          "User-Agent" => "sunny-b"
        }
      )

      data = JSON.parse(response.body)

      {
        owner: owner,
        repository: repo,
        stars: data["stargazers_count"],
        forks: data["forks_count"],
        watchers: data["watchers_count"],
        language: data["language"]
      }
    end
  end

  JSON.generate({
    # Retrieve return values of each thread
    response: res.map(&:value),
    time: Time.now.to_f - start_time.to_f
  })
end
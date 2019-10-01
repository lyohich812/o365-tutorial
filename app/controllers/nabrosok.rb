#ne rabotaet
https://login.microsoftonline.com/common/oauth2/v2.0/authorize?
client_id=846dd872-d7d0-443b-9919-f2e060e19031
&response_type=code
&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fauthorize%2F
&response_mode=query
&scope=openid%20profile%20offline_access%20https%3A%2F%2Fgraph.microsoft.com%2Fuser.read%20https%3A%2F%2Fgraph.microsoft.com%2Fmail.read%20https%3A%2F%2Fgraph.microsoft.com%2Fcontacts.read%20https%3A%2F%2Fgraph.microsoft.com%2Fcalendars.read
&state=12345

auth_code
#otkuda ego bldjad
mainToken = client.auth_code.get_token(
        auth_code,
        redirect_uri: authorize_url,
        scope: SCOPES.join(' ')
      )
    #initialize once through auth_code
if mainToken.expired?
    mainToken=mainToken.refresh!
    #kak variant create job to .refresh! once at hour
else
    token_hash = mainToken.to_hash
    
    authorize_url = "http://localhost:3000/authorize"


    client = OAuth2::Client.new(
      CLIENT_ID, CLIENT_SECRET,
      site: "https://login.microsoftonline.com",
      authorize_url: "/common/oauth2/v2.0/authorize",
      token_url: "/common/oauth2/v2.0/token"
    )


    token = OAuth2::AccessToken.from_hash(client, token_hash)

    access_token = token.token

    token = access_token

    callback = Proc.new do |r|
            r.headers['Authorization'] = "Bearer #{token}"
    end

    graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0',
                                    cached_metadata_file: File.join(MicrosoftGraph::CACHED_METADATA_DIRECTORY, 'metadata_v1.0.xml'),
                                    &callback)
    
    
    @events = graph.me.events.order_by('start/dateTime asc').to_json
    @contacts = graph.me....
    #json v Model uje tam mojno i v bazu
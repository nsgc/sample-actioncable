App.subject = App.cable.subscriptions.create "SubjectChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    {id, name, body, action} = data
    htmlId = 'subject_' + id

    switch action
      when "create"
        html = "<dl id=#{htmlId}><dt>#{name}</dt><dd>#{body}</dd><dd>Edit Delete</dd></dl>"
        $('#subjects').append(html)
      when "update"
        dl = $("dl##{htmlId}")
        dl.children('dt').text(name)
        dl.children('dd:first').text(body)
      when "destroy"
        $("dl##{htmlId}").remove()
      else
        alert "Caution!"

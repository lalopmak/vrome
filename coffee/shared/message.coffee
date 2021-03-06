chrome.runtime.onMessage.addListener (msg, sender, sendResponse) ->

  # Get Function
  func = (func ? window)[action] for action in msg.action.split(".")

  # Get Argument
  argument = msg.arguments ? msg
  argument = (if (argument instanceof Array) then argument else [argument])

  # Run Function & Pass Tab to it
  tab = sender.tab
  tab.sendResponse = sendResponse if tab
  argument.push tab
  func.apply "", argument  if func instanceof Function

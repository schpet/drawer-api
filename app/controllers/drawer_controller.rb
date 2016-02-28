class DrawerController < ApplicationController
  def index
    message = [
      "hello. you're looking at the drawer server, perhaps you're",
      'more interested in seeing the client? ',
      ENV.fetch('ORIGIN', '(no client specified in .env!)')
    ].join(' ')

    render text:  message
  end
end

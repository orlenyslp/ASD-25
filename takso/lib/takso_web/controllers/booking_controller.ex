defmodule TaksoWeb.BookingController do
    use TaksoWeb, :controller

    # Function to go to the Booking order page
    def new(conn, _params) do
      # Render the page where to order a taxi
      render conn, "new.html"
    end
end

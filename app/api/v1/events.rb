module API
  module V1
    class Events < Grape::API
      namespace :events do

        get nil do
          { ok: true}
        end
      end
    end
  end
end

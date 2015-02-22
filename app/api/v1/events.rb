module API
  module V1
    class Events < Grape::API
      include API::V1::Defaults

      namespace :events do
        get nil do
          { ok: true}
        end
      end
    end
  end
end

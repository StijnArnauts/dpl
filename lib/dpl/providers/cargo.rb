module Dpl
  module Providers
    class Cargo < Provider
      status :alpha

      description sq(<<-str)
        tbd
      str

      env :cargo

      opt '--token TOKEN', 'Cargo registry API token', required: true, secret: true
      opt '--allow_dirty', 'Allow publishing from a dirty git working directory'

      cmds publish: 'cargo publish %{publish_opts}'

      def deploy
        shell :publish
      end

      private

        def publish_opts
          opts_for(%i(token allow_dirty), dashed: true)
        end
    end
  end
end

require 'response_callback/version'

module ResponseCallback
  module ResponseCallbackInitializer
    def initialize(yield_var: :no_var_given)
      @var = yield_var
    end
  end

  class Success
    include ResponseCallbackInitializer

    def on_success
      yield @var
    end

    def on_fail
      return
    end
  end

  class Fail
    include ResponseCallbackInitializer

    def on_success
      return
    end

    def on_fail
      yield @var
    end
  end
end

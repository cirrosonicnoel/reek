
module Reek
  module Core

    #
    # A list of smell detectors of the same class, but with differing
    # configurations.
    #
    class DetectorStack

      def initialize(default_detector)
        @detectors = [default_detector]
      end

      def adopt(config)
        @detectors[-1].configure_with(config)
      end

      def listen_to(hooks)
        @detectors.each { |det| det.listen_to(hooks) }
      end

      def report_on(report)
        @detectors.each { |det| det.report_on(report) }
      end
    end
  end
end

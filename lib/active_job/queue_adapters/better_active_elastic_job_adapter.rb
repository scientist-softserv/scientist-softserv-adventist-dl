module ActiveJob
  module QueueAdapters
    class BetterActiveElasticJobAdapter < ActiveElasticJobAdapter
      class << self
        def aws_sqs_client
          @aws_sqs_client ||= Aws::SQS::Client.new
        end

        private

          def queue_url(*_)
            if Settings.active_job_queue.url
              Settings.active_job_queue.url
            else
              super
            end
          end
      end
    end
  end
end

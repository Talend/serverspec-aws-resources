require_relative 'resources/s3_bucket_resource'
require_relative 'resources/vpc_resource'
require_relative 'resources/subnets_resource'
require_relative 'resources/vpn_gateway_resource'
require_relative 'resources/ec2_instance_resource'
require_relative 'resources/dynamodb_resource'
require_relative 'resources/sqs_queue_resource'
require_relative 'resources/sns_resource'
require_relative 'resources/swf_domain_resource'
require_relative 'resources/swf_activity_type_resource'
require_relative 'resources/swf_workflow_type_resource'
require_relative 'resources/security_group_resource'
require_relative 'resources/launch_configuration_resource'
require_relative 'resources/auto_scaling_group_resource'
require_relative 'resources/elb_resource'
require_relative 'resources/iam_role_resource'
require_relative 'resources/cloudtrail_resource'
require_relative 'resources/cloudwatch'

# Check if the initialization argument of an AWS resource class is present
# @param arg_name [String] - The name of the init argument
# @param class_name [String] - The name of the AWS resource class
# @param arg [String] - The arg passed to the class constructor
# @raise [RuntimeError] if arg.nil?
def check_init_arg(arg_name, class_name, arg)
  raise "Must specify #{arg_name} for #{class_name}" if arg.nil?
end

# Check the length for operations that should return only one resource
# @param item_name [String] - The name of the item to check
# @param item [Array] - The actual item for checking the length
# @raise [RuntimeError] if item.length == 0
# @raise [RuntimeError] if item.length > 1
def check_length(item_name, item)
  raise "No #{item_name} with the specified name were "\
             'returned' if item.empty?
  raise "Multiple #{item_name} with the same name "\
             'were returned' if item.length > 1
end
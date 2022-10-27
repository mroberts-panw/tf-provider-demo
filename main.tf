terraform {
  required_providers {
    prismacloud = {
      source  = "paloaltonetworks/prismacloud"
    }
  }
}

provider "prismacloud" {
    url = "api4.prismacloud.io"
}

resource "prismacloud_policy" "tf_policy_code" {
  name        = "build_only_policy_2: a code policy created with terraform"
  policy_type = "config"
  cloud_type  = "aws"
  severity    = "high"
  description = "this describes the policy"
  rule {
    name = "build_only_policy_2: a code policy created with terraform"
    parameters = {
      "savedSearch" : false,
      "withIac" : true,
    }
    rule_type = "Config"
    children {
      type           = "build"
      recommendation = "fix it"
      metadata = {
        "code" : file("policy.yaml"),
      }
    }
  }
} 
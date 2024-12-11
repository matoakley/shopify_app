# frozen_string_literal: true

module ShopifyApp
  module FrameAncestors
    extend ActiveSupport::Concern

    included do
      content_security_policy do |policy|
        domain_host = current_shopify_domain || "*.#{::ShopifyApp.configuration.myshopify_domain}"
        policy.frame_ancestors "#{ShopifyAPI::Context.host_scheme}://#{domain_host}", "https://admin.#{::ShopifyApp.configuration.unified_admin_domain}"
      end
    end
  end
end

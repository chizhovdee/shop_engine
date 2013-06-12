ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #   span :class => "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end


    div :id => :new_order_message do
      span :class => "text" do
        t(".new_order_message")
      end
    end

    div do
      %{
        <script type="text/javascript">
          $(function(){
            AdminOrder.setup();
          });
        </script>
      }.html_safe
    end

    columns do

      column do
        panel t(".new_orders", :count => Order.with_state(:new).count) do
          table_for Order.with_state(:new).order("created_at DESC") do 
            column :item do |order|
              link_to(order.item.articul, admin_order_path(order))
            end

            column :customer_name
            column :created_at
          end
        end
      end

      column do
        panel t(".new_orders_call", :count => OrderCall.with_state(:new).count) do
          table_for OrderCall.with_state(:new).order("created_at DESC") do 
            column :customer_name do |order|
              link_to(order.customer_name, admin_order_path(order))
            end

            column :customer_phone

            column :created_at
          end
        end
      end

      column do
        panel t(".accepted_orders", :count => Order.with_state(:accepted).count) do
          table_for Order.with_state(:accepted).order("created_at DESC") do 
            column :name do |order|
              link_to(order.item.articul, admin_order_path(order))
            end

            column :customer_name
            column :created_at
          end
        end
      end

      column do
        panel t(".in_processing_orders", :count => Order.with_state(:in_processing).count) do
          table_for Order.with_state(:in_processing).order("created_at DESC") do 
            column :name do |order|
              link_to(order.item.articul, admin_order_path(order))
            end

            column :customer_name
            column :created_at
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

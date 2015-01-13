module GrapeApi
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    helpers do
    #   def check_token
    #     if params[:auth_token]
    #       @current_user = User.find_by_token(params[:auth_token])
    #     else
    #       @current_user = nil
    #     end
    #   end

    #   def require_login
    #     error!("Requied login", 401) unless current_user
    #   end

    #   def current_user
    #     @current_user
    #   end
        def v1_products_url(x)
          "/api/v1/products?page=#{x.values[0]}"
        end
      def v1_products_url(page)
        "/api/v1/grape/products?page=#{page.values[0]}"
      end

      def store_product_url(product)
        "/store/products/#{product.id}"
      end
    end

    resource :grape do
      get :products do
        # require_login
        @products = Product.page( params[:page] ).per(1)
        {
          data:
          [
            url: store_product_url(@products[0]),
            name: @products[0].name,
            description: @products[0].description,
            qty: @products[0].qty,
            price: @products[0].price,
            created_at: @products[0].created_at,
            updated_at: @products[0].updated_at
          ],
          paging:{
            current_page: @products.current_page,
            total_pages: @products.total_pages,
            per_page: @products.limit_value,
            next_url: (@products.last_page?)? nil : v1_products_url( page: @products.next_page ),
            previous_url: (@products.first_page?)? nil : v1_products_url( page: @products.prev_page )
          }
        }
      end
    end

  end
end
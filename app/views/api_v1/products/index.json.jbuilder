json.data do
  json.partial! "product", collection: @products, as: :p

  json.array!(@products) do |p|
    json.url store_product_url(p)
    json.name p.name
    json.description p.description
    json.qty p.qty
    json.price p.price
    json.created_at p.created_at
    json.updated_at p.updated_at
  end

end

json.paging do
  json.current_page @products.current_page
  json.total_pages @products.total_pages
  json.per_page @products.limit_value
  json.next_url (@products.last_page?)? nil : v1_products_url( page: @products.next_page )
  json.previous_url (@products.first_page?)? nil : v1_products_url( page: @products.prev_page )
end
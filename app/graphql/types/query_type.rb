Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :users, !types[Types::UserType] do
    description 'List of all the users'
    resolve ->(obj, args, ctx) {
      User.active.all
    }
  end

  field :items, !types[Types::ItemType] do
    description 'List of all the items available for purchase'
    resolve ->(obj, args, ctx) {
      Item.active.all
    }
  end
end

Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :first_name, !types.String
  field :last_name, !types.String

  field :orders, !types[Types::OrderType]
  field :credits, !types[Types::CreditType]
end

Types::ItemType = GraphQL::ObjectType.define do
  name 'Item'

  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String
  field :order, !types.Int
  field :image, !types.String
  field :price, !types.Float

  field :orders, !types[Types::OrderType]
end

Types::OrderType = GraphQL::ObjectType.define do
  name 'Order'

  field :id, !types.ID
  field :amount, !types.Int
  field :item, Types::ItemType do
    resolve ->(obj, args, ctx) { obj.item }
  end
  field :user, Types::UserType do
    resolve ->(obj, args, ctx) { obj.user }
  end
end

Types::CreditType = GraphQL::ObjectType.define do
  name 'Credit'

  field :id, !types.ID
  field :amount, !types.Int
  field :user, Types::UserType do
    resolve ->(obj, args, ctx) { obj.user }
  end
end



def require_basic_authentication
  raise UnauthorizedRequestError, 'Basic' unless authenticate_with_http_basic do |client_id, client_secret|
    @oauth_client = ApiClient.active.find_by(client_id: client_id, client_secret: client_secret)
  end
end


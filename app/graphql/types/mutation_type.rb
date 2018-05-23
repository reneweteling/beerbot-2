Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :create_order, Types::OrderType do
    description "Create a new order"
    argument :amount, !types.Int
    argument :user_id, !types.Int
    argument :item_id, !types.Int

    resolve ->(obj, args, ctx) {
      Order.create(
        amount: args[:amount],
        item: Item.find(args[:item_id]),
        user: User.find(args[:user_id]),
      )
    }
  end
end
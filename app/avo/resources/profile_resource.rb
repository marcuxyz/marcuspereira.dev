class ProfileResource < Avo::BaseResource
  self.title = :fullname
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :first_name, as: :text
  field :last_name,  as: :text
  field :user, as: :belongs_to
  # add fields here
end

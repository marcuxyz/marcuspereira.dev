class PostResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  self.find_record_method = lambda { |model_class:, id:, params:|
    model_class.friendly.find id
  }

  field :id, as: :id
  field :title, as: :text
  field :content, as: :trix
  field :status, as: :select, enum: ::Post.statuses
  field :news, as: :boolean
  field :embeded_video, as: :textarea
  field :attachment, as: :file
  field :category, as: :belongs_to
end

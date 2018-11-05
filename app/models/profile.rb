class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :diet
  has_one :personal_diet
  has_many :added_recipes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :diet_id, presence: true
  validates :height, presence: true
  validates :weight, presence: true
<<<<<<< HEAD
  validates :gender, inclusion: { in: ['Female', 'Male'] }, presence: true

  after_create :add_personal_diet

  private

# compute les objectifs de la personal diet apres la creation du profile
  def add_personal_diet
    PersonalDiet.create(profile: self).compute_personal_diet(self)
  end
=======
  validates :gender, inclusion: { in: ['Female', 'Male'] }

  def suggested_recipes(added_recipes, recipes)
    tracker = AddedRecipe.tracker(added_recipes)


    recipes.where("protein_per_portion <= ? and carbohydrate_per_portion <= ? and calcium_per_portion <= ? and sodium_per_portion <= ?",
                  personal_diet[:protein_obj_personal] - tracker[:protein] < 0 ? 0 : personal_diet[:protein_obj_personal] - tracker[:protein],
                  personal_diet[:carbohydrate_obj_personal] - tracker[:carbohydrate] < 0 ? 0 : personal_diet[:carbohydrate_obj_personal] - tracker[:carbohydrate],
                  personal_diet[:calcium_obj_personal] - tracker[:calcium] < 0 ? 0 : personal_diet[:calcium_obj_personal] - tracker[:calcium],
                  personal_diet[:sodium_obj_personal] - tracker[:sodium] < 0 ? 0 : personal_diet[:sodium_obj_personal] - tracker[:sodium]).shuffle.first(4)
  end

>>>>>>> 8d71483e109c9a873c44f2a194c1c3d4d3965f1d
end

FactoryBot.define do
    factory :task do
      title { 'Test Task' }
      description { 'This is a test task.' }
      due_date { Date.today + 7.days }
      status { 'ToDo' }
      association :owner, factory: :user
    end
end
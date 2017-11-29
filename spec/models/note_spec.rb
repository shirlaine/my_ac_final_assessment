require 'rails_helper'

RSpec.describe Note, type: :model do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:likes) }

  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of(:body) }
end

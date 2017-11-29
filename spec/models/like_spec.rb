require 'rails_helper'

RSpec.describe Like, type: :model do
  it { expect(subject).to belong_to(:note) }
  it { expect(subject).to belong_to(:user) }

  it { expect(subject).to validate_presence_of(:note) }
  it { expect(subject).to validate_presence_of(:user) }
end

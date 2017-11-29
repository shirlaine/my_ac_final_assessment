require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(subject).to validate_presence_of(:username) }
  it { expect(subject).to have_many(:notes) }
  it { expect(subject).to have_many(:likes) }
  it { expect(subject).to have_many(:active_relationships) }
  it { expect(subject).to have_many(:leaders) }
  it { expect(subject).to have_many(:passive_relationships) }
  it { expect(subject).to have_many(:followees) }
end

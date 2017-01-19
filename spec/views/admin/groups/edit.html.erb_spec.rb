require 'rails_helper'

RSpec.describe 'admin/groups/edit', type: :view do
  context 'groups index page' do
    let(:group) { FactoryGirl.create(:group) }

    before do
      allow(controller).to receive(:params).and_return(
        controller: 'admin/groups',
        action: 'edit',
        id: group.id
      )
      assign(:group, group)
      render
    end

    it 'has the "description" tab in an active state' do
      expect(rendered).to have_selector('.nav-tabs .active a', text: 'Description')
    end

    it 'has tabs for other actions on the group' do
      expect(rendered).to have_selector('.nav-tabs li a', text: 'Users')
      expect(rendered).to have_selector('.nav-tabs li a', text: 'Remove')
    end

    it 'has an input for name' do
      expect(rendered).to have_selector('input', id: 'hyku_group_name')
    end

    it 'has a text area for description' do
      expect(rendered).to have_selector('textarea', id: 'hyku_group_description')
    end

    it 'has a save button' do
      expect(rendered).to have_selector('input', class: 'action-save')
    end

    it 'has a cancel button' do
      expect(rendered).to have_selector('a', class: 'action-cancel')
    end
  end
end

# let(:user) { create(:user) }  
# let(:adminUser) { create(:admin) }

# describe "with valid token", validToken: true do  
#   before(:each) { authWithUser(user) }

#   describe "GET #show" do
#     let(:user) { create(:user) }
#     before(:each) { get :show, id: user.id }

#     it "returns the information for one user" do
#       expect(json).to have_key('user')
#     end

#     it { should respond_with 200 }
#   end

#   describe "GET #index" do
#     let!(:users) { create_list(:user, 2) }

#     context "with id parameters" do
#       before(:each) { get :index, { :users => [ users.first.id ] } }

#       it "returns a subset of users" do
#         expect(json['test_models'].count).to eq(1)
#       end

#       it { should respond_with 200 }
#     end

#     context "without id parameters" do
#       before(:each) { get :index }

#       it "returns all users" do
#         expect(json['users'].count).to eq(2)
#       end

#       it { should respond_with 200 }
#     end
#   end
# end

# describe "with admin token", adminToken: true do  
#   before(:each) { authWithUser(adminUser) }

#   # there are no admin specific actions for the show and index methods
#   # the above code would authorize an admin user before each test
# end

# describe "without a valid token", noToken: true do  
#   before(:each) { clearToken }
#   after(:each) { expect(response.status).to eq(401) }

#   it "GET #show is unauthorized" do
#     get :show, id: 0
#   end

#   it "GET #index is unauthorized" do
#     get :index
#   end
# end

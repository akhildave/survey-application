child @users, :object_root => true do
  attributes *User.column_names
  node(:mission_ids) {|user| user.missions.map(&:id)}
end

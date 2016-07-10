# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
usernames = ["taliesin", "sean", "haizop", "neal616", "maddie", "bob"]
full_names = ["Todd R.", "Sean O.", "Haiz O.", "Neal W.", "Maddie M.", "Bob Z."]
icons = ["cornflowerblue", "plum", "lightcoral", "goldenrod", "forestgreen", "pink"]
channels = ["general", "random", "private"]
direct_message_users = [[0,1], [0,2], [0,2,3,4], [0,3], [0,4], [0,5], [0,1,2,3,4,5,6]]
all_users = [0,1,2,3,4,5,6]
private_channel_users = [0,1,2,3,4,5]

groups = Group.create([{group_name: "Webschool"}, {group_name: "Explorers"}])

usernames.each_with_index do |username, i|
  User.create(username: username, 
              full_name: full_names[i], 
              present: false,
              current_channel_id: 1,     
              icon: icons[i])
end

groups.each do |group|
  
  group_id = group.id
  
  channels.each do |channel|
    name = channel != "private" ? channel : group.group_name.downcase
    ch_record = Channel.create(name: channel,                 
                             group_id: group_id, 
                             private: channel == "private",
                             channel_type: "group",
                             created_by: usernames[0],
                             topic: "Add a topic")
                             
    ch_record.messages.create(beginning: true,
                             content: "",
                             group_id: group_id,
                             user_id: 1,
                             timestamp: 1466784530560)
                             
    users = channel == "private" ? private_channel_users : all_users;
    users.each { |u_id| ch_record.channel_users.create(user_id: u_id) }
  end
  
  direct_message_users.each do |u_list|
    names = u_list.map{ |i| usernames[i] }
    ch_record = Channel.create(usernames: names,
                               group_id: group_id,
                               channel_type: "direct")
    ch_record.messages.create(beginning: true,
                              content: "",
                              group_id: group_id,
                              user_id: 1,
                              timestamp: 1466784530560)
    u_list.each { |u_index| ch_record.channel_users.create(user_id: u_index + 1) }
  end
  
  User.all.each_with_index do |user, i|
    user.group_users.create(group_id: group_id)
    Channel.all.each do |channel|
      channel_id = channel.id
      if (channel_id + i) % 3 == 0
        user.user_channel_stars.create(channel_id: channel_id)
      end
    end
  end
end

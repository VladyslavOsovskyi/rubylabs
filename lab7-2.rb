def check_password(expected_user, expected_pass)
  proc do |input_user, input_pass|
    input_user == expected_user && input_pass == expected_pass
  end
end

# test
admin = check_password("u1", "p1")

puts admin.call("u1", "p1") # -> true
puts admin.call("u")        # -> false
puts admin.call("u1", "p2") # -> false
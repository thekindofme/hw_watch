require 'test_helper'

class AdminTest < ActiveSupport::TestCase

  test "able to create an admin with valid data" do
    admin=Admin.new
    admin.email="new_admin@testserver.com"
    admin.password="secret"
    admin.password_confirmation="secret"
    assert admin.save
  end

  test "unable to create an admin with invalid email" do
    admin=Admin.new
    admin.email="new_admintestserver.com"
    admin.password="secret"
    admin.password_confirmation="secret"
    assert !admin.save
  end

  test "unable to create an admin with invalid password" do
    admin=Admin.new
    admin.email="new_admin@testserver.com"
    admin.password="se"
    admin.password_confirmation="se"
    assert !admin.save
  end

  test "unable to create an admin when password doesn't match the password confirmation" do
    admin=Admin.new
    admin.email="new_admin@testserver.com"
    admin.password="ser23rdfdf23w"
    admin.password_confirmation="seasd2143124r"
    assert !admin.save
  end

  test "unable to create an two admins with the same email" do
    admin=Admin.new
    admin.email="new_admin@testserver.com"
    admin.password="ser23rdfdf23w"
    admin.password_confirmation="seasd2143124r"
    admin.save

    admin=Admin.new
    admin.email="new_admin@testserver.com"
    admin.password="ser23rdfdf23w"
    admin.password_confirmation="seasd2143124r"
    assert !admin.save
  end
end

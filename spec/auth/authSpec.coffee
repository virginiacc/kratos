auth = require('../../lib/auth/auth')

super_admin   = {name: 'admin'}
team_admin    = {name: 'etkdg394hpmujn', roles: []}
team_gh_admin = {name: 'nauhbkuwmkjvqq', roles: ['gh|user']}
user          = {name: 'thubsn24joa5gk', roles: []}
kratos_admin  = {name: 'nahubk_hpb49km', roles: ['kratos|admin']}
both_admin    = {name: 'ahbksexortixvi', roles: ['kratos|admin']}

team         = {roles: {admin: {members: ['etkdg394hpmujn', 'ahbksexortixvi', 'nauhbkuwmkjvqq']}}}


describe 'auth._has_resource_role', () ->
  it 'returns true if the user has the role for the resource', () ->
    actual = auth._has_resource_role(kratos_admin, 'kratos', 'admin')
    expect(actual).toBe(true)

  it 'returns false if the user does not have the role for the resource', () ->
    actual = auth._has_resource_role(user, 'kratos', 'admin')
    expect(actual).toBe(false)

describe 'auth._is_resource_admin', () ->
  it 'returns true if the user has is an admin for the resource', () ->
    actual = auth._is_resource_admin(kratos_admin, 'kratos')
    expect(actual).toBe(true)

  it 'returns false if the user is not an admin for the resource', () ->
    actual = auth._is_resource_admin(user, 'kratos')
    expect(actual).toBe(false)

describe 'auth._has_team_role', () ->
  it 'returns true if the user has the role for the team', () ->
    actual = auth._has_team_role(team_admin, team, 'admin')
    expect(actual).toBe(true)

  it 'returns false if the user does not have the role for the team', () ->
    actual = auth._has_team_role(user, team, 'admin')
    expect(actual).toBe(false)

describe 'auth._is_team_admin', () ->
  it 'returns true if the user has the admin role for the team', () ->
    actual = auth._is_team_admin(team_admin, team)
    expect(actual).toBe(true)

  it 'returns false if the user does not have the role for the team', () ->
    actual = auth._is_team_admin(user, team)
    expect(actual).toBe(false)

describe 'auth.add_team_asset', () ->
  it 'calls the add_team_asset method of the resource and returns the result', () ->
    actual = auth.add_team_asset(team_gh_admin, team, 'gh')
    expect(actual).toBe(true)
  it 'returns false if the resource does not exist', () ->
    actual = auth.add_team_asset(team_gh_admin, team, 'xx')
    expect(actual).toBe(false)

describe 'auth.remove_team_asset', () ->
  it 'calls the remove_team_asset method of the resource and returns the result', () ->
    actual = auth.remove_team_asset(team_gh_admin, team, 'gh')
    expect(actual).toBe(true)
  it 'returns false if the resource does not exist', () ->
    actual = auth.remove_team_asset(team_gh_admin, team, 'xx')
    expect(actual).toBe(false)

describe 'auth.add_resource_role', () ->
  it 'calls the add_resource_role method of the resource and returns the result', () ->
    actual = auth.add_resource_role(super_admin, 'gh', 'user')
    expect(actual).toBe(true)
  it 'returns false if the resource does not exist', () ->
    actual = auth.add_resource_role(super_admin, 'xx', 'user')
    expect(actual).toBe(false)
  it 'returns false if the resource role does not exist', () ->
    actual = auth.add_resource_role(super_admin, 'gh', 'xx')
    expect(actual).toBe(false)

describe 'auth.remove_resource_role', () ->
  it 'calls the remove_resource_role method of the resource and returns the result', () ->
    actual = auth.remove_resource_role(super_admin, 'gh', 'user')
    expect(actual).toBe(true)
  it 'returns false if the resource does not exist', () ->
    actual = auth.remove_resource_role(super_admin, 'xx', 'user')
    expect(actual).toBe(false)
  it 'returns false if the resource role does not exist', () ->
    actual = auth.remove_resource_role(super_admin, 'gh', 'xx')
    expect(actual).toBe(false)

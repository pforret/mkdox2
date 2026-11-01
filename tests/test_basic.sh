#!/usr/bin/env bash
# test functions should start with test_
# using https://github.com/pgrange/bash_unit
#  fail
#  assert
#  assert "test -e /tmp/the_file"
#  assert_fails "grep this /tmp/the_file" "should not write 'this' in /tmp/the_file"
#  assert_status_code 25 code
#  assert_equals "a string" "another string" "a string should be another string"
#  assert_not_equals "a string" "a string" "a string should be different from another string"
#  fake ps echo hello world

root_folder=$(cd .. && pwd) # tests/.. is root folder
# shellcheck disable=SC2012
# shellcheck disable=SC2035
root_script=$(find "$root_folder" -maxdepth 1 -name "*.sh" | head -1) # normally there should be only 1

test_no_parameters_shows_usage() {
  # script without parameters should give usage info
  assert "$root_script"
}

test_usage_shows_option_verbose() {
  # script without parameters should show option -v or --verbose
  assert_equals 1 "$("$root_script" 2>&1 | grep -c "Usage")"
  assert_equals 1 "$("$root_script" 2>&1 | grep -c "verbose")"
}

# 'new' asks for the template before creating anything or running Docker, so these need no Docker daemon
test_new_menu_lists_three_templates_in_order() {
  local tmp output
  tmp=$(mktemp -d)
  output=$(cd "$tmp" && printf 'x\n' | "$root_script" new demo 2>&1)
  assert_equals "1) simple 2) with_blog 3) karpathy_wiki" "$(echo "$output" | grep -oE '[0-9]\) [a-z_]+' | tr '\n' ' ' | sed 's/ $//')"
  assert_equals 0 "$(echo "$output" | grep -cE 'ai_employee|committee|dev_project')"
  rm -rf "$tmp"
}

test_new_invalid_choice_creates_nothing() {
  local tmp
  tmp=$(mktemp -d)
  assert_status_code 1 "cd '$tmp' && printf '9\\n' | '$root_script' new demo" "invalid choice should exit with status 1"
  assert_equals 1 "$(cd "$tmp" && printf '9\n' | "$root_script" new demo 2>&1 | grep -c 'Invalid choice: 9')"
  assert "test ! -e '$tmp/demo'" "invalid choice should not create the project folder"
  rm -rf "$tmp"
}

test_new_unknown_template_creates_nothing() {
  local tmp
  tmp=$(mktemp -d)
  assert_status_code 1 "cd '$tmp' && '$root_script' -B nope new demo </dev/null" "unknown -B template should exit with status 1"
  assert_equals 1 "$(cd "$tmp" && "$root_script" -B nope new demo </dev/null 2>&1 | grep -c "Template 'nope' not found")"
  assert "test ! -e '$tmp/demo'" "unknown -B template should not create the project folder"
  rm -rf "$tmp"
}

test_build_without_config_fails() {
  local tmp
  tmp=$(mktemp -d)
  mkdir "$tmp/docs" # without docs/, build stops earlier with "No 'docs' folder found"
  assert_status_code 1 "cd '$tmp' && '$root_script' build </dev/null" "build without zensical.toml/mkdocs.yml should exit with status 1"
  assert_equals 1 "$(cd "$tmp" && "$root_script" build </dev/null 2>&1 | grep -c 'No zensical.toml or mkdocs.yml found')"
  rm -rf "$tmp"
}

test_usage_exits_with_status_0() {
  assert_status_code 0 "'$root_script'" "usage screen should exit with status 0"
}


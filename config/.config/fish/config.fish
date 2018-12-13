# Don't print working directory in a compact way.
set -gx fish_prompt_pwd_dir_length 0

# ---------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------
# If Ruby exists, we want to have it's bins available.
if command -v ruby > /dev/null
  set -l ruby_dir (ruby -e 'print Gem.user_dir')
  set -l ruby_bin_dir $ruby_dir/bin

  if test ! -d $ruby_bin_dir
    mkdir -p $ruby_bin_dir
    echo "Created $ruby_bin_dir directory"
  end

  set -x GEM_HOME $ruby_dir
  set -x PATH $PATH $ruby_bin_dir
end

# How can we miss Rust?
if command -v cargo > /dev/null
  set -l cargo_bin_dir ~/.cargo/bin
  if test ! -d $cargo_bin_dir
    mkdir -p $cargo_bin_dir
    echo "Created $cargo_bin_dir directory"
  end

  set -x PATH $PATH $cargo_bin_dir
end

# The same applies to Yarn
if command -v yarn > /dev/null
  set -l yarn_bin_dir (yarn global bin 2> /dev/null)

  if test ! -d $yarn_bin_dir
    mkdir -p $yarn_bin_dir
    echo "Created $yarn_bin_dir directory"
  end

  set -x PATH $PATH $yarn_bin_dir
end

# Set the best editor
if command -v nvim > /dev/null
  set -x EDITOR nvim
else if command -v vim > /dev/null
  set -x EDITOR vim
else
  set -x EDITOR vi
end

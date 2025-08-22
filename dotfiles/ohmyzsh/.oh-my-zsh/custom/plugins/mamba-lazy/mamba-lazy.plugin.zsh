# Lazy load mamba
lazy_mamba_aliases=('conda' 'mamba' 'micromamba')
load_mamba() {
  for lazy_mamba_alias in $lazy_mamba_aliases; do
    unalias $lazy_mamba_alias
  done

  # Set up mamba
  export MAMBA_EXE='/opt/homebrew/bin/micromamba';
  export MAMBA_ROOT_PREFIX='/Users/jrobinson/.config/mamba';
  __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__mamba_setup"
  else
      alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
  fi
  unset __mamba_setup
  unfunction load_mamba
}

for lazy_mamba_alias in $lazy_mamba_aliases; do
  alias $lazy_mamba_alias="load_mamba && $lazy_mamba_alias"
done
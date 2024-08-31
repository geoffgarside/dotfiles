return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    local colors = require 'nvim-highlight-colors'
    colors.setup {
      render = 'virtual',

      virtual_symbol = '■',
      virtual_symbol_prefix = ' ',
      virtual_symbol_suffix = '',
      virtual_symbol_position = 'eow',

      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_var_usage = true,
      enable_named_colors = true,
    }
  end,
}

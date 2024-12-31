local is_ok, barbar = pcall(require, "barbar")
if not is_ok then
	return
end

barbar.setup{
  icons = {
    buffer_index = true,
  }
}

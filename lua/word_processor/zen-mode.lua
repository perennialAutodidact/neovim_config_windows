local status_ok, true_zen = pcall(require, "true-zen")
if not status_ok then
  return
end

true_zen.setup({
  modes = {
    ataraxis = {
      shade = "dark",
      backdrop = 0,
      minimum_writing_area = {
        width = 120,
        height = 50,
      },
    },
    narrow = {
      ataraxis = true,
    },
  }
})


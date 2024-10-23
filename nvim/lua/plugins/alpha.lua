return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  opts = function(_, opts)
    local logo = [[
              *             *            *      *          *        *         *   *       
             /\ \     *    /\ \         /\ \   /\ \    * / /\      /\ \      /\_\/\_\ _   
            /  \ \   /\_\ /  \ \       /  \ \  \ \ \  /_/ / /      \ \ \    / / / / //\_\ 
           / /\ \ \_/ / // /\ \ \     / /\ \ \  \ \ \ \___\/       /\ \_\  /\ \/ \ \/ / / 
          / / /\ \___/ // / /\ \_\   / / /\ \ \ / / /  \ \ \      / /\/_/ /  \____\__/ /  
         / / /  \/____// /_/_ \/_/  / / /  \ \_\\ \ \   \_\ \    / / /   / /\/________/   
        / / /    / / // /____/\    / / /   / / / \ \ \  / / /   / / /   / / /\/_// / /    
       / / /    / / // /\____\/   / / /   / / /   \ \ \/ / /   / / /   / / /    / / /     
      / / /    / / // / /______  / / /___/ / /     \ \ \/ /___/ / /__ / / /    / / /      
     / / /    / / // / /_______\/ / /____\/ /       \ \  //\__\/_/___\\/_/    / / /       
     \/_/     \/_/ \/__________/\/_________/         \_\/ \/_________/        \/_/        



	  [ @dirdr ]
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"

    opts.config.header = vim.split(logo, "\n")

    opts.config.center = {
      { action = "lua LazyVim.pick()()", desc = " Find File", icon = " ", key = "f" },
      { action = 'lua LazyVim.pick("live_grep")()', desc = " Find Text", icon = " ", key = "g" },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    return opts
  end,
}

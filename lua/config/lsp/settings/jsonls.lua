local opts = {
	settings = {
		json = {
			-- https://www.schemastore.org/json/
			schemas = require("schemastore").json.schemas {
				select = {
					".eslintrc",
					"package.json",
					"tsconfig.json",
					"prettierrc.json",
				},
			},
		},
	},
}

return opts

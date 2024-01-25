local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("typescript", {
	s("ittest", {
		t('it("should '),
		i(1),
		t('", () => expect('),
		i(2),
		t(").toBe("),
		i(3),
		t("))"),
	}),
	s("clog", {
		t("console.log("),
		i(1),
		t(");"),
	}),
	s("desctest", {
		t('describe("test cases", () => {'),
		i(1),
		t("})"),
	}),
})

import type { UserConfig } from "@commitlint/types";

const configuration: UserConfig = {
	extends: ["@commitlint/config-conventional"],
	parserPreset: {
		parserOpts: {
			headerPattern:
				/^(\p{Emoji_Presentation}|\p{Emoji}\ufe0f?\s*)?(\w*)(?:\((.*)\))?: (.*)$/u,
			headerCorrespondence: ["emoji", "type", "scope", "subject"],
		},
	},
};

export default configuration;

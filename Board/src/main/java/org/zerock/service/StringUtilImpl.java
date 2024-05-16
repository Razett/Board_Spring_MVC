package org.zerock.service;

import org.springframework.stereotype.Service;

@Service
public class StringUtilImpl implements StringUtil{

	@Override
	public String removeScriptTags(String input) {
		String cleanedInput = input.replaceAll("(?i)<script.*?>|</script.*?>", "");
        return cleanedInput;
	}

}

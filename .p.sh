#!/usr/bin/env bash
function p() {
	jq -n \
		--arg content "$*" \
		'{
      "model": "mistral-7b-instruct",
      "messages": [
        {
          "role": "system",
          "content": "Be precise and concise."
        },
        {
          "role": "user",
          "content": $content
        }
      ],
    }' | curl --silent \
		--request POST \
		--url https://api.perplexity.ai/chat/completions \
		--header 'accept: application/json' \
		--header "authorization: Bearer $PERPLEXITY_API" \
		--header 'content-type: application/json' \
		--data @- | jq --unbuffered --raw-input -j 'gsub("^data: "; "") | gsub("\r$"; "") | \
                select(. != null and . != "") | fromjson | .choices[0].message.content'
}

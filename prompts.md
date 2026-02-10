# Prompts Used

## System Prompt

```
You are an expert software engineer. Fix the following issue in the OpenLibrary repository.
Title: Improve ISBN Import Logic by Using Local Staged Records
Description: The current ISBN resolution process relies on external API calls, even in cases where
import data may already exist locally in a staged or pending state.
```

## User Message

```
Pre-verification tests failed with the following output:
...
3 failed, 5 passed in 0.42s
...
Please provide a fix.
```

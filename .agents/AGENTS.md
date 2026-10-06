# Global Agent Instructions

- Never use the em dash "—". Use plain dash "-"
- Use the fff MCP tools for all file search operations instead of default tools.
- When writing commit messages, NEVER auto-add your agent name as co-author
- When doing bug fixes, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would experience if possible. This will make you find the real problem so that you will be able to actually fix it.

# Code Quality & Refactoring Standards

## 1. High Standards & Linting
* Maintain **strict adherence** to the project's established linting, formatting, and typing configurations.
* Do not bypass, disable, or ignore compiler warnings, linter errors, or type checker complaints in any file you modify.
* Write clean, idiomatic, and self-documenting code following industry best practices for the specific language and framework being used.

## 2. Proactive Error Correction ("Leave It Better Than You Found It")
* **Scope Expansion:** If you encounter unrelated syntax errors, linter warnings, broken imports, or deprecation notices while working in a file, **fix them immediately**.
* **Zero-Tolerance for Existing Debt:** Do not limit your scope strictly to the feature or bug you are working on if the surrounding code in that file is broken or poorly formatted.
* **Exceptions:** If an unrelated error requires a massive architectural change or impacts files completely outside your current working context, document it clearly in your response and open a separate issue or task rather than leaving it broken.

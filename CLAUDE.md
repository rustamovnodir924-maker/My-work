# My-work

## gstack

This repo uses [gstack](https://github.com/garrytan/gstack). A SessionStart hook
(`.claude/hooks/install-gstack.sh`) installs it into `~/.claude/skills/gstack`
at the start of each session; the install log is `~/.gstack-install.log`.

Skills such as /office-hours, /plan-ceo-review, /plan-eng-review, /review,
/investigate and /ship are available once it is installed. Use
~/.claude/skills/gstack/... for gstack file paths.

Browser-based skills (/qa, /browse, /design-review, /scrape, /make-pdf,
/diagram) may be unavailable in cloud sessions if gstack's bundled Chromium
could not be installed; say so plainly if one is needed.

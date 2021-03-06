# Features

## MobileOrg feature overview

- Support for Dropbox or WebDAV as a transfer mechanism
- Org files are stored offline and available anywhere
- Complete editing support, including editable headings, body text,
  todo state, tags and priority.
- Note-taking facility built in, including offline support
- Full-text search, or search by keyword (TODO, DONE, WAITING) or by
  tag (errand, office)
- Mark nodes as done, or flag them with an optional note for reference
  later
- Document view of your outlines, for reading document-style Org files
  with long body text
- Powerful support for linking between Org files
- Org-mode integration

Org-mode has built-in support for MobileOrg (or any other mobile
client that may come along in the future and use the same asymmetric
synchronization approach).

A simple `org-mobile-push` will stage your complete set of Org-files for
MobileOrg to pick them up. The result includes:

- An Org file representing all of your custom agenda views
  - Automatic checksum file construction to speed up sync
  - Automatic index.org file generation with links to all of your Org
    files
- A powerful `org-mobile-pull` command, which will integrate changes
  you’ve made on the go into a local Org file

# Known Issues

- The screen which is used for flagging a note does not match overall
  look & feel

# MobileOrg Release Notes

- MobileOrg 1.7.1
  - UI: Adapting to new iOS versions
  - BACKEND: Dropbox API v2 
  - BUG: Fixed bug where the capture-badge was not updated if a
    capture was deleted
  - UI: New Launchscreen
  - BUG: Heading level skips
    [#62](https://github.com/MobileOrg/mobileorg/issues/62)
  
-  MobileOrg 1.6.1 (current)
  - UI: New Org-mode logo
  - UI: New icons
  - FEATURE: Autocapture
  
-  MobileOrg 1.5.1
  - BUG: Fix crash bug introduced for users of 1.5 who weren’t using
    encryption.
  
- MobileOrg 1.5
  - FEATURE: Encryption support (Encryption help)

  
- MobileOrg 1.4
  - FEATURE: Add support for iOS 4
  - FEATURE: Add support for iPad

- BUG: Fix bug where Dropbox password wouldn’t be accepted unless you
  hit enter after typing it
- BUG: Fix “Bad file encoding” bug in captured notes list when using
  Dropbox.
- UI: Make keyboard use email style when entering Dropbox email
  address.
- MobileOrg 1.3
- FEATURE: Add support for Dropbox in addition to WebDAV. Just link
  with your Dropbox account in MobileOrg settings, then set
  ~/Dropbox/MobileOrg as your staging directory in Org-mode. Then
  org-mobile-push and sync in MobileOrg, and that’s all there is to
  it.

- MobileOrg 1.2
  - BUG: Captured notes list was not emptying even after a full sync
    cycle.
- MobileOrg 1.1
  - FEATURE: Add back the ‘…’ indicator for items with children
  - FEATURE: Add application badge to show unsynced item count on
    iPhone home screen (configurable via Settings page)
  - FEATURE: Add support for strikethrough text in document view
  - FEATURE: Support org files named “.org”
  - UI: Sort tag list case insensitively
  - UI: Make todo state and priority pages close on selection (or
    clear button)
  - BUG: Escape *’s at the beginning of notes (prevents breakage)
  - BUG: Settings page no longer clears local cache when URL field is
    selected but not changed
  - BUG: Fix action menu not working on Agenda items
  - BUG: Support Windows newlines everywhere
  - BUG: Use less memory when parsing, handle larger files
  - BUG: Support org files with multiple dots in filenames
  - BUG: Action menu/sync status pages were acting strange when phone
    was placed in an unknown orientation state (laying flat, mostly)
 

# Encryption

MobileOrg now supports encryption so that files on your WebDAV server
or Dropbox are not stored in plain text.

Be sure you are using MobileOrg 1.5+ and Org-mode 7.02+.

To configure Org-mode to use encryption, use:

```
;; Enable encryption
(setq org-mobile-use-encryption t)
;; Set a password
(setq org-mobile-encryption-password "mypassword")
```

Then run `org-mobile-push` from Emacs after reloading your configuration
file. You should notice that the files in your staging area are
encrypted.

Next, open MobileOrg and enter your encryption password in the
Settings tab. Perform a sync, and you are done.


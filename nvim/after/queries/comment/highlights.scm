; extends

("text" @text.danger
 (#any-of? @text.danger "SAFETY" ))

((tag
  (name) @comment.safety
  ":" @comment.delimiter)
  (#eq? @comment.safety "SAFETY"))

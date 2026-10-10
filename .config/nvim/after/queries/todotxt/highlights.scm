; ~/.config/nvim/after/queries/todotxt/highlights.scm
; extends

(done_task) @todotxt.done
(task) @todotxt.pending

(date) @todotxt.date
(context) @todotxt.context
(project) @todotxt.project

(priority) @todotxt.priority.other

((priority) @todotxt.priority.a (#eq? @todotxt.priority.a "(A)"))
((priority) @todotxt.priority.b (#eq? @todotxt.priority.b "(B)"))
((priority) @todotxt.priority.c (#eq? @todotxt.priority.c "(C)"))
((priority) @todotxt.priority.d (#eq? @todotxt.priority.d "(D)"))

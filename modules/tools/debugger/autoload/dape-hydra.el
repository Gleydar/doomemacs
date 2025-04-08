;; tools/debugger/autoload/dape-hydra.el -*- lexical-binding: t; -*-
;;;###if (modulep! :tools debugger +lsp +dape)

(defhydra dape-hydra (:color pink :hint nil :foreign-keys run)
  "
^Stepping^          ^Switch^                 ^Breakpoints^         ^Debug^                     ^Eval
^^^^^^^^----------------------------------------------------------------------------------------------------------------
_n_: Next                                    _bb_: Toggle          _dd_: Debug                 _ee_: Eval
_i_: Step in        _st_: Thread             _bd_: Delete          _dr_: Debug recent          _er_: Eval region
_o_: Step out       _sf_: Stack frame        _ba_: Add             _dl_: Debug last            _es_: Eval thing at point
_c_: Continue       _su_: Up stack frame     _bc_: Set condition   _de_: Edit debug template   _ea_: Add expression.
_r_: Restart frame  _sd_: Down stack frame   _bh_: Set hit count   _ds_: Debug restart
_Q_: Disconnect     _sl_: List locals        _bl_: Set log message
                  _sb_: List breakpoints
                  _sS_: List sessions
"
  ("n" dape-next)
  ("i" dape-step-in)
  ("o" dape-step-out)
  ("c" dape-continue)
  ("bb" dape-breakpoint-toggle)
  ("bc" dape-breakpoint-expression)
  ("bl" dape-breakpoint-log)
  ("dd" dape)
  ("ds" dape-restart)
  ("er" dape-evaluate-expression)
  ("q" nil "quit" :color blue)
  ("Q" dape-disconnect :color red))

;;;###autoload
(defun dape-hydra ()
  "Run `dape-hydra/body'."
  (interactive)
  (dape-hydra/body))
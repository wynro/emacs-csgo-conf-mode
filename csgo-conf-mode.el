;;; csgo-conf-mode.el --- CS:GO Configuration files syntax highlighting

;; Copyright (C) 2016  Guillermo Robles <guillerobles1995@gmail.com>

;; Author: Guillermo Robles <guillerobles1995@gmail.com>
;; URL: https://github.com/wynro/emacs-csgo-conf-mode
;; Keywords: languages
;; Version: 1.0

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Major mode for editing CS:GO Configuration files

;;; Code:

(defconst csgo-conf-font-lock-keywords
  (list
   '("\\\/\/.*" . font-lock-comment-face)
   '("\\<\\(alias\\|bind\\|cl_\\(?:d\\(?:emoviewoverride\\|ownloadfilter\\|rawhud\\)\\|showfps\\|vote_ui_active_after_voting\\)\\|d\\(?:emo\\(?:list\\|ui2?\\)\\|isguise\\)\\|ex\\(?:ec\\|it\\|plode\\)\\|f\\(?:ov\\(?:_desired\\)?\\|ps_max\\)\\|h\\(?:idepanel\\|ud_\\(?:combattext_batching\\|fastswitch\\)\\)\\|impulse\\|jpeg\\(?:_quality\\)?\\|kill\\|m\\(?:at_\\(?:bumpmap\\|compressedtextures\\|dxlevel\\|p\\(?:hong\\|icmip\\)\\|queue_mode\\|specular\\)\\|p_\\(?:autoteambalance\\|decals\\|maxrounds\\|restartround\\|\\(?:t\\(?:eams_unbalance_\\|ime\\)\\|win\\)limit\\)\\)\\|net_graph\\(?:height\\|pos\\)?\\|record demoname\\|s\\(?:ay\\(?:_team\\)?\\|creenshot\\|how\\(?:mapinfo\\|scores\\)\\|top\\|v_\\(?:all\\(?:ow\\(?:\\(?:down\\|up\\)load\\)\\|talk\\)\\|gravity\\|hltv\\|lan\\|pa\\(?:ssword\\|usable\\)\\|voiceenable\\)\\)\\|t\\(?:f_\\(?:dingaling_pitchm\\(?:\\(?:ax\\|in\\)dmg\\)\\|hud_target_id_\\(?:alpha\\|disable_floating_health\\)\\)\\|oggleconsole\\)\\|v\\(?:iewmodel_fov\\|oice\\(?:_menu_[123]\\|menu\\|record\\)\\)\\)\\>" . font-lock-builtin-face)
   '("\\<\\(a\\(?:k47\\|ug\\|wp\\)\\|bizon\\|de\\(?:agle\\|coy\\|fuser\\)\\|elite\\|f\\(?:amas\\|lashbang\\|n57\\)\\|g\\(?:3sg1\\|alil\\(?:ar\\)?\\|lock\\)\\|h\\(?:egrenade\\|kp2000\\)\\|incgrenade\\|m\\(?:249\\|4a1\\(?:_silencer\\)?\\|a\\(?:c10\\|g7\\)\\|olotov\\|p[79]\\)\\|n\\(?:egev\\|ova\\)\\|p\\(?:\\(?:25\\|9\\)0\\)\\|s\\(?:c\\(?:ar20\\|out\\)\\|g55[26]\\|mokegrenade\\|sg08\\)\\|t\\(?:aser\\|ec9\\)\\|u\\(?:mp45\\|sp_silencer\\)\\|vest\\(?:helm\\)?\\|xm1014\\)\\>" . font-lock-constant-face)
   '("\\<\\(ALT\\|BACKSPACE\\|C\\(?:APSLOCK\\|TRL\\)\\|D\\(?:EL\\|OWNARROW\\)\\|E\\(?:N\\(?:D\\|TER\\)\\|SCAPE\\)\\|F\\(?:1[012]\\|[1-9]\\)\\|HOME\\|INS\\|L\\(?:EFTARROW\\|WIN\\)\\|M\\(?:OUSE[1-5]\\|WHEEL\\(?:DOWN\\|UP\\)\\)\\|NUMLOCK\\|PG\\(?:DN\\|UP\\)\\|R\\(?:CTRL\\|IGHTARROW\\|SHIFT\\|WIN\\)\\|S\\(?:CROLLLOCK\\|EMICOLON\\|HIFT\\|PACE\\)\\|TAB\\|UPARROW\\|[]\"',.-9=A-[`-]\\)\\>" . font-lock-constant-face)
   )
  "Font lock keywords for CS:GO Config Mode."
  )

(defvar csgo-conf-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?_ "w" table)
    (modify-syntax-entry ?\/ ". 12b" table)
    (modify-syntax-entry ?\n "> b" table)
    table)
  "Syntax table for `csgo-conf-mode'.")

(defun csgo-conf-indent-line ()
  "Indent current line of CS:GO Configuration."
  (indent-line-to 0))

(defun csgo-conf-outline-level ()
  "Outline level of CS:GO Configuration."
  0)

;;;###autoload
(define-derived-mode csgo-conf-mode conf-mode "Config[CS:GO]"
  "Major mode for editing CS:GO configuration files."

  (setq font-lock-defaults  '(csgo-conf-font-lock-keywords nil t nil)
	case-fold-search     t)

  (set (make-local-variable 'comment-start) "//")
  (set (make-local-variable 'comment-start-skip)
       (concat (regexp-quote comment-start) "+\\s *"))
  (set (make-local-variable 'comment-end) "")

  (set (make-local-variable 'indent-line-function)
       'csgo-conf-indent-line)
)

(provide 'csgo-conf-mode)
;;; csgo-conf-mode.el ends here

module Jilo.Commands where

import Text.Printf

data Command =
    NotImplemented String
    | AddNote String
    | ListNotes
    | Usage

usage :: String
usage = "Jilo supports the following commands:\n\
    \    For Notes\n\
    \       note <url-or-text> <hash-tags>\n\
    \    For Scheduling\n\
    \        appt <text> <date-time> <hash-tags> - NOT IMPLEMENTED\n\
    \        appt <text> <date-time> <location> <hash-tags> - NOT IMPLEMENTED\n\
    \    For Tasks\n\
    \        task <title> <due-date-time> <hash-tags> - NOT IMPLEMENTED\n\
    \    For Friends\n\
    \        friend <name> <email | text | twitter> - NOT IMPLEMENTED\n\
    \    For Sharing\n\
    \        share <jilo-id> <friend> <email | text | twitter> - NOT IMPLEMENTED\n\
    \        share <jilo-id> <address> - NOT IMPLEMENTED\n\
    \    For Editing - opens app or cli-editor\n\
    \        edit <jilo-id> - NOT IMPLEMENTED\n\
    \    For Meta\n\
    \        list <note | appt | tasks | hash-tags | mined-keywords>\n\
    \        graph <hash-tags | mined-keywords> <relationship-depth> - NOT IMPLEMENTED\n\
    \        stats summary <hash-tags | mined-keywords> - NOT IMPLEMENTED\n\
    \        stats detail <hash-tags | mined-keywords> - NOT IMPLEMENTED"

notImplemented :: String -> String
notImplemented =
    printf "Sorry, this command is not supported yet: %s"


% lilypond --include=$EES_TOOLS_PATH --png -dresolution=300 -dno-point-and-click -dcrop file.ly

\version "2.24.2"

\include "ees.ly"
#(set-global-staff-size 11.22)
\paper {
  oddHeaderMarkup = ##f
  paper-width = 100\cm
}

% \layout{
%   \context {
%     \Staff
%     \override Clef.full-size-change = ##t
%   }
% }

partSs = \markup \remark "S solo"
partAs = \markup \remark "A solo"
partTs = \markup \remark "T solo"
partBs = \markup \remark "B solo"
partSc = \markup \remark "S coro"
partSic = \markup \remark "S 1 coro"
partAc = \markup \remark "A coro"
partTc = \markup \remark "T coro"
partBc = \markup \remark "B coro"
partFl = \markup \remark "fl"
partClni = \markup \remark "clno 1, 2"
partTrbi = \markup \remark "trb 1"
partVi = \markup \remark "vl 1"
partVii = \markup \remark "vl 2"
partVla = \markup \remark "vla"
partVlcSolo = \markup \remark "vlc solo"

gotoBar = #(define-music-function
  (parser location num)
  (string?)
  #{
    \mark \markup \remark #num
    \bar "||"
    \once \override Score.BreakAlignment.break-align-orders =
      #(make-vector 3 '(span-bar
                        breathing-sign
                        staff-bar
                        clef
                        key-signature
                        time-signature))
  #})

\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r8 e4 c8 a16[ gis] a8 \tuplet 3/2 8 { a'16[ g f] } e[ dis]
    \tuplet 3/2 8 { e[ dis e] } e,8 h'4 r8 h d f
    e8.\trill d32[ c] h8 \tuplet 3/2 8 { c16[ h a] } \sbOn a'64([ g f16.) e16 d] \sbOff c4\trill \noBreak
    h2 r\fermata
  }
}

SoliLyrics = \lyricmode {
  O che bel -- la Tor -- to --
  rel -- la! ô che bel -- la
  bel -- la Tor -- to -- rel -- _
  la.
}

Continuo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    a4\p r f' r
    e r d r
    c r dis2
    e r\fermata
  }
}

BassFigures = \figuremode {
  r1
  <_+>2 <4\+ _!>
  <6> <7 5>
  <_+>1
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Savoiard"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}

\version "2.24.2"
\include "header.ly"

twoonetime = {
  \overrideTimeSignatureSettings
    1/2
    1/8
    #'(4)
    #'((end . (((1 . 16) . (4 4)))))
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twoonetime \key a \major \time 1/2 \tempoMarkup "Larghetto"
    a''16(-\conSord e) e( cis) cis8 h
    r16 cis e( a) \tuplet 3/2 8 { \sbOn gis fis e d cis h \sbOff }
    cis e, a cis e8 fis16( e)
    e8 d16 cis \tuplet 3/2 8 { \sbOn fis e d cis h a \sbOff }
    gis( e') dis( e) \hA dis( e) \hA dis( e)
    cis( cis') a( fis) \tuplet 3/2 8 { \sbOn dis e fis fis gis a \sbOff }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twoonetime \key a \major \time 1/2 \tempoMarkup "Larghetto"
    e'16(-\conSord cis) cis( a) a8 gis
    a cis h~ \tuplet 3/2 8 { h16 a gis }
    a cis, e a cis8 d16( cis)
    cis8 h16 a \tuplet 3/2 8 { \sbOn fis' e d cis h a \sbOff }
    gis( e') dis( e) \hA dis( e) \hA dis( e)
    cis( cis') a( fis) dis8~ \tuplet 3/2 8 { dis16 e fis }
  }
}

Soli = {
  \relative c {
    \clef bass
    \twoonetime \key a \major \time 1/2 \autoBeamOff \tempoMarkup "Larghetto"
    r4 a8 h16[ gis]
    a4 e16[ gis] h[ d]
    cis4 e8 fis16[ e]
    e8 d16[ cis] \tuplet 3/2 8 { fis[ e d] cis[ h a] }
    gis4 h8 e
    cis \tuplet 3/2 8 { cis16[ dis e] } \hA dis8 \tuplet 3/2 8 { dis16[ e fis] }
  }
}

SoliLyrics = \lyricmode {
  Troſt und
  Freud, Süeſ -- ſig --
  kheit iſt auf
  e -- wig zue -- be --
  reüth je -- nem
  ſo die Sün -- de
}

Continuo = {
  \relative c {
    \clef bass
    \twoonetime \key a \major \time 1/2 \tempoMarkup "Larghetto"
    a8 a' a e
    cis a e' e,
    a a' a a
    a a, d dis
    e fis gis e
    a fis h a
  }
}

BassFigures = \figuremode {
  r2
  r
  r4. <6 4>8
  <_+>
  r
  r4 <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "St: Petrus"
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

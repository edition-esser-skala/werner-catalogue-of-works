\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Presto"
    a''4. gis8 a e fis cis
    d h e e, a16 h cis h a cis h a
    h cis d cis h d cis h cis d e d cis e d cis
    d e fis e d fis e d e8 a, a'4~
    a8 h16( a) gis4. fis16( e) fis4\trill
    e16 fis gis fis e gis fis e fis gis a gis fis a gis fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Presto"
    R1
    r2 r8 a' a a
    a4( gis) r8 g g g
    g4( fis) r8 e e e
    dis4 r e'4. dis8
    e h cis gis a fis h h,
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \tempoMarkup "Presto"
    a'4 h cis a~
    a gis fis2
    e r8 e e e
    d2 r8 cis cis cis
    h4 e h' h,
    e e'2 dis4
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Presto"
    R1*6
  }
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
  >>
}

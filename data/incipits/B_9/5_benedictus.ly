\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \mixolydian \time 4/4 \tempoMarkup "Larghetto"
    gis'16. h32 e16. gis32 h16. fis32 dis16. h32 \tuplet 3/2 8 { gis16 fis e } e8 h'( his)
    his( cis) cis64( h ais16.) gis64( fis e16.) dis a''32 a8\trill r16 a, a8\trill
    gis64( a h16.) cis64( h a16.) e fis32 fis8\trill e4 r
    r8 gis\p \tuplet 3/2 8 { h16 a gis } gis8 r2
    r8 dis' \tuplet 3/2 8 { fis16 e dis } dis8 r e16( cis) ais8.\trill ais16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \mixolydian \time 4/4 \tempoMarkup "Larghetto"
    gis'16. h32 e16. gis32 h16. fis32 dis16. h32 \tuplet 3/2 8 { gis16 fis e } e8 h'( his)
    his( cis) cis64( h ais16.) gis64( fis e16.) dis a''32 a8\trill r16 a, a8\trill
    gis64( a h16.) cis64( h a16.) e fis32 fis8\trill e4 r
    r8 e\p \tuplet 3/2 8 { gis16 fis e } e8 r2
    r8 h' \tuplet 3/2 8 { dis16 cis h } h8 r e16( cis) ais8.\trill ais16
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key e \mixolydian \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1*2
    r2 e4^\solo h'
    \tuplet 3/2 8 { gis16[ fis e] } e8 r gis fis16[ gis ais h] \tuplet 3/2 8 { cis[ h ais] gis[ fis e]
    dis[ cis h] } h8 r fis' gis4 ais8. ais16
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit in no -- _ "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key e \mixolydian \time 4/4 \tempoMarkup "Larghetto"
    e8-\solo gis dis h e[ fis] gis r
    a r ais r h fis dis h
    e a h h, e gis dis h
    e4 r8 e ais,4. ais8
    h4 r8 h' e, cis fis e
  }
}

BassFigures = \figuremode {
  r1
  r4 <6>2.
  r1
  r2 <6>4. <5>8
  <_+>4. q q4
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}

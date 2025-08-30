\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante"
    R1*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante"
    R1*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    a'4^\solo e' cis r8 fis
    \sbOn \tuplet 3/2 8 { e16[ fis e } d cis] \tuplet 3/2 8 { d[ e d } cis h] cis8 a r fis'
    \tuplet 3/2 8 { e16[ fis e } d cis] \tuplet 3/2 8 { d[ e d } cis h] \sbOff cis[ d cis d] e8 e,
    a16[ h] cis4 h16[ a] gis8 h e[ e,]~
    e[ \tuplet 3/2 8 { a16 gis fis] } \appoggiatura e8 dis4\trill e r
    r2 r4 r8 d'!
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ son, e --
  lei -- _ son, __ _ e --
  lei -- _ _ son, e -- lei --
  _ son,
  "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    e4^\solo h' gis r8 cis
    \sbOn \tuplet 3/2 8 { h16[ cis h } a gis] \tuplet 3/2 8 { a[ h a } gis fis] gis8 e r fis
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*6
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*6
  }
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Andante"
    a'8-\solo cis gis e a gis16 fis e8 d
    cis fis h, e a, a'16 gis fis8 e16 d
    cis8 fis h, e a, a'4 gis8
    fis e dis4 e8 \hA dis cis gis'
    a cis h h, e e' cis a
    gis cis fis, h e, e'16 d! cis8 d
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r8 <6> <7> <6> r2
  r4 <4>8 <_+> r2
  r1
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}

\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Allegro"
    a4 cis'8( a) d( h)
    e cis \grace h4 a2
    e8 gis h d h' d,
    d cis \grace h4 a2 \gotoBar "22"
    R2.*4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Allegro"
    a4 cis'8( a) d( h)
    e cis \grace h4 a2
    e8 gis h d h' d,
    d cis \grace h4 a2 \gotoBar "22"
    R2.*4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    R2.*4 \gotoBar "22"
    a'4(^\solo cis8[ a)] d[ h]
    e[ cis] \grace h4 a2
    h8[ gis fis e] d'4
    cis8[ h] a2
  }
}

SopranoLyrics = \lyricmode {
  Wann __ der
  Him -- mel
  laſ -- ſet
  fal -- len,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Allegro"
    a2 h4
    cis a8 h cis4
    gis' e gis
    a a,8 h cis h \gotoBar "22"
    a2 h4
    cis a8 h cis4
    gis' e gis
    a cis,8 h a4
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  q
  r
  r
  r
  r
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
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}

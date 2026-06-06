\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Andante"
    R2.*2
    d4-\solo f2
    es16( f) g8 f( es) d( c)
    d16( c) d8 d4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Andante"
    R2.*2
    b4-\solo d2
    c16( d) es8 d( c) b( a)
    b16( a) b8 b4 r
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    b'4^\solo d2
    c16[ d es8] d[\trill c] b[\trill a]
    b[ a] b4 r
    R2.
    b4 d16[ es d8] c8 b
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit,

  qui ve -- nit in
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Andante"
    b4-\solo b' g
    es f f,
    b2 b'4-\markup \remark "con Pedale"
    es, f f,
    b r r
  }
}

BassFigures = \figuremode {
  r2.
  <6>4 <6 4> <5 3>
  r2.
  r
  r
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

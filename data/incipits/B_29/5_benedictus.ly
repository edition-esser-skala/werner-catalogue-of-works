\version "2.24.2"
\include "header.ly"

ViolinoIeII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 e'\f h( a) h, a'
    g16( a32 h c d e fis) g8 c, d,16( fis) a( c) \gotoBar "8"
    e,4 r r
    r8 \tuplet 3/2 8 { g'16 fis e } d8 g, r4
    R2.
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2 \gotoBar "8"
    r8 h'4^\solo c8 h16[ g a fis]
    g4 r8 e' d!16[ h c a]
    h8 g d' e16 fis g[ e] d[ c]
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- di --
  ctus, qui ve --
  nit in no -- mi -- ne Do -- "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2 \gotoBar "8"
    r8 g'4^\solo e16[ fis] g[ e fis dis]
    e4 r8 c' h16[ g a fis]
    g4 r r
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di --
  ctus, qui ve --
  nit
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    e4-\solo r8 fis dis h
    e4 r8 e fis d \gotoBar "8"
    e4 r8 a h h,
    e4 h8 c d! d,
    g h' fis d e fis
  }
}

BassFigures = \figuremode {
  r2.
  r4. <6>8 q4
  r2 <6 4>8 <5 _+>
  r2 <6 4>8 <5 _+>
  r2.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "vl 1, 2"
        \ViolinoIeII
      }
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

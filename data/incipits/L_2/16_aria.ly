\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    R1*4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    R1*4
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r16 f, b f d'8 b16 d f8 f16 f f8. f16
    d8 f f8. f16 d4 r8 a
    b c16[ d] es[ d] es8 es16[ d] d8 r d16[ es]
    f8 a, b d c16[ b] a[ g] f8 b16[ d]
  }
}

SoliLyrics = \lyricmode {
  Auf auf ihr Völk -- le ihr Völk -- le es tä -- get
  ſchon es tä -- get ſchon, I
  hör die Eng -- le ſin -- ge daß
  Hän -- le kreht die Sonn auf -- geht, die
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    b4 r16 b' d b a b a g f es d c
    b b' a g f es d c b d' c b a g f es
    d g32 f es16 d c8 f b, b'16 c d b b b
    a g f es d c b b' a g f es d c b8
  }
}

BassFigures = \figuremode {
  r1
  r
  <6>8 q4 <7>8 <4> <3>4.
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
        \set Staff.instrumentName = "Schwabnwürth"
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
  \layout { indent = 1.5\cm }
}

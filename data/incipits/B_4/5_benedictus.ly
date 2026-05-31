\version "2.24.2"
\include "header.ly"

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    f,4^\solo^\aDue g f8 b4 a8
    g c4 h8 c4 r
    r2 r8 e d8. d16
    cis8 d4 c b!16 c a8. a16
    gis8 a4 \hA gis8 a c h[ e]
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- _ _ nit
  in no -- mi --
  ne Do -- _ mi -- ni, no -- mi --
  ne Do -- mi -- ni, qui "ve -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1
    c4^\solo^\aDue d c8 f4 e8
    d g4 f8 e a4 gis8
    a a g8. g16 fis8 g4 f8
    e e d[ h'] c,4 r
  }
}

BassoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui %2
  ve -- _ _ _ _ _
  nit in no -- mi -- ne Do -- mi --
  ni, qui ve -- nit,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Larghetto"
    f,8-\solo^\aDue f'4 e8 d4 e8 f~
    f e d4 e8 a, h c~
    c h a d~ d c b4
    a8 f' e es d g d4~
    d8 c h4 a8 a'4 g8
  }
}

BassFigures = \figuremode {
  r8 <3> <2> <6> <5> <6-> <5>4
  <5 2>8 r <7> <6!> <6> q <5>4
  <4\+ 2>8 <6> <7 _+> <3> <4\+ 2> <6> <7> <6\\>
  <_+> <6> <7> <6> <7 _+> <_-> <4> <_!>
  <4\+ 2> <6> <7> <6\\>4 <3>8 <2!> <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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

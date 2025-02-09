\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    r2 c^\solo
    d4 f2 e4
    r f e d
    c r d2
    e4. e8 f4 e
  }
}

AltoLyrics = \lyricmode {
  Be --
  ne -- di -- ctus,
  qui ve -- _
  nit in
  no -- mi -- ne "Do -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    g2^\solo a4 c~
    c h r c
    h a g r
    a2 h4. h8
    c4 c4. d8 c4
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne -- di --
  ctus, qui
  ve -- _ nit
  in no -- mi --
  ne "Do -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Larghetto"
    c8-\solo d e c f g a g
    f e d g c, g' c c,
    g' g, d' a16 h c8 e f g
    a g f e d g, g' f
    e d c h a h c a'
  }
}

BassFigures = \figuremode {
  r1
  <6 5>4 <6>8 <7> <4> <\t> <3>4
  r4. <6> <6 5>4
  r2 <6>
  r1
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
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

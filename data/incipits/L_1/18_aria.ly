\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
    r16 g\f c e g c, e g
    c g c e g c, e g
    c8 g e c
    R2
    r4 g'16\p f e8
    r4 c16 d e8
    r4 e,16 f g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
    r4 r16 g\f c e
    g c, e g c e, g c
    e8 c g e
    R2
    r4 e'16\p d c8
    r4 e,16 f g8
    r4 c,16 d e8
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \twofourtime \key c \major \time 2/4 \autoBeamOff \tempoMarkup "Allegro"
    R2*2
    r4 r8 c
    h16[ c] a[ h] g[ a] f[ g]
    e[ d c8] r c'
    h d g, c
    h d g, e'
  }
}

SoliLyrics = \lyricmode {
  Äns
  bitt I mir dö
  auß ä
  Krie -- gl Wein muß
  ä da ſeyn ſonſt
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
    c4\f r
    c r
    c r8 c'\p
    h a g f
    e c r4
    g'8. f16 e8 c
    g'8. f16 e8 c
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
  r
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
        \set Staff.instrumentName = \markup \center-column { "Hollähippen-" "Krämer" }
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
}

\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Vivace"
    c16\f c c c c' c c c
    g' g g g g, g g g
    c c c c c' c c c \gotoBar "13"
    R2
    r8 g,\p \tuplet 3/2 4 { c[ d es] }
    R2
    r4 es8. d32 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Vivace"
    r8 es\f es es
    d d' g g,
    r c es f \gotoBar "13"
    R2
    r8 g,\p \tuplet 3/2 4 { es8[ d c] }
    R2*2
  }
}

Soli = {
  \relative c {
    \clef bass
    \twofourtime \key c \dorian \time 2/4 \autoBeamOff \tempoMarkup "Vivace"
    R2*3 \gotoBar "13"
    c'4 g
    \tuplet 3/2 4 { es8[ d c] } r es'
    d[ h] g[ f]
    es[ d] c4
  }
}

SoliLyrics = \lyricmode {
  Nun ſoll
  ſich mein
  Rach auß --
  güeſ -- ſen
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Vivace"
    c8 c' c4~
    c8 h b4~
    b8 a as4 \gotoBar "13"
    c,8 es h g
    c4 r8 c
    h4 g
    c2
  }
}

BassFigures = \figuremode {
  r2
  <5 2>8 <6>4.
  <2>4 <5>8 <6>
  r2
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
        \set Staff.instrumentName = "Judex"
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

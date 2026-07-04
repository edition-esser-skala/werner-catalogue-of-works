\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d8 a16 d fis8 d16 fis
    a8-! r d-! r
    fis, d16 fis a8 fis16 a
    d8-! r fis-! r
    d a16 d fis8 d16 fis
    a8-! r d-! r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    fis4 r
    fis16 g a g fis8 r
    a4 r
    d16 e fis e d8 r
    fis4 r
    fis16 g a g fis8 r
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d4 r
    d16 e fis e d8-! r
    fis4 r
    fis16 g a g fis8-! r
    a4 r
    a16 g fis g a8-! r
  }
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d4 r
    d'8-! r d,-! r
    d,4 r
    d''8-! r d,-! r
    d,4 r
    d''8-! r d,-! r
  }
}

BassFigures = \figuremode {
  %tacet
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
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
}

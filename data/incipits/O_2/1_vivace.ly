\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Vivace"
    a''8-! r h-! r
    cis, d~ \tuplet 6/4 4 { d16 e fis g[ a h] }
    cis,8 d \tuplet 6/4 4 { d,16[\p e fis] g a h }
    cis,8 d \tuplet 6/4 4 { r16 fis'\f g a g fis
    e cis d e d cis d h cis d cis h }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Vivace"
    a''8-! r h-! r
    cis, d~ \tuplet 6/4 4 { d16 e fis g a h }
    cis,8 d \tuplet 6/4 4 { d,16\p e fis g a h }
    cis,8 d \tuplet 6/4 4 { r16 d'\f e fis e d }
    cis a' cis a h, gis' h \hA gis
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Vivace"
    d8-! r g-! r
    a d, r4
    a'8 d, r4
    a'8\p d, r4
    R2
  }
}

BassFigures = \figuremode {
  r2
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
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}

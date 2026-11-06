\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegr[ett]o [passato]"
    r8 d'16\p a' g8 fis
    e d cis h
    a16 g fis8 r4
    R2
    r8 a d fis
    h,16( a) h8 r4
    r a'16( g) a8~
    a cis, d e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegr[ett]o [passato]"
    R2*2
    r8 a'16\p fis' e8 d
    cis h a g
    fis16 e d8 r4
    r8 d g h
    e,16( d) e8 r4
    R2
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \twofourtime \key d \major \time 2/4 \autoBeamOff \tempoMarkup "Allegr[ett]o [passato]"
    a2
    a4. h16[ cis]
    d([ e fis8)] e[ d]
    cis[ h] a[ g]
    fis4 d'
    h g'16[ fis e8]
    \appoggiatura d8 cis4 d
    e16([ d cis h]) a8 g
  }
}

SoliLyrics = \lyricmode {
  Ein
  Schwab mueß
  ſchwö -- ren
  wie be --
  kandt wann
  er will
  wan -- dern
  auß __ _ dem
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegr[ett]o [passato]"
    d8 fis e d
    cis h a g
    \kneeBeam fis d'' cis h
    a g fis e
    d e fis d
    g fis e g
    a g fis16 e d8
    cis a h cis
  }
}

BassFigures = \figuremode {
  %tacet
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
        \set Staff.instrumentName = "Schnepfendrekh"
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

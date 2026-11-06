\version "2.24.2"
\include "header.ly"

TenoreI = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*3
    r2 r8 e e e
  }
}

TenoreILyrics = \lyricmode {
  So legt di
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1
    r2 r4 r8 h8
    d16 d d d h8 g e' e16 c a a g a
    fis r r8 r4 r8 g c g
  }
}

TenoreIILyrics = \lyricmode {
  So
  wär -- thet halt biß mor -- gä früe biß der Hal -- ter treibt die
  Küeh. So legt di
}

TenoreIII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*3
    r2 r8 c g c
  }
}

TenoreIIILyrics = \lyricmode {
  So legt di
}

BassoI = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 d16 d fis8 a h8. h,16 h4
    fis'8. fis16 a8 h g8. g16 g8 r
    R1
    r2 r8 c, c c
  }
}

BassoILyrics = \lyricmode {
  Ha -- mär ſchon bald fin -- ſter Nacht,
  iſt mär no koä Rich -- ter gmacht.

  So legt di
}

BassoII = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*3
    r16 d fis d g d f? g e8 r r4
  }
}

BassoIILyrics = \lyricmode {
  I kim enk nit bin wie ä Bock.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    fis2 dis~
    dis e
    h c4 cis
    d h c2
  }
}

BassFigures = \figuremode {
  <6>2 <6>
  r1
  r
  <_+>4 <6>2.
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Schullmeiſter"
        \new Voice = "TenoreI" { \dynamicUp \TenoreI }
      }
      \new Lyrics \lyricsto TenoreI \TenoreILyrics

      \new Staff {
        \set Staff.instrumentName = "Schwabnwürth"
        \new Voice = "TenoreII" { \dynamicUp \TenoreII }
      }
      \new Lyrics \lyricsto TenoreII \TenoreIILyrics

      \new Staff {
        \set Staff.instrumentName = "Schnepfendrekh"
        \new Voice = "TenoreIII" { \dynamicUp \TenoreIII }
      }
      \new Lyrics \lyricsto TenoreIII \TenoreIIILyrics

      \new Staff {
        \set Staff.instrumentName = "Mazko"
        \new Voice = "BassoI" { \dynamicUp \BassoI }
      }
      \new Lyrics \lyricsto BassoI \BassoILyrics

      \new Staff {
        \set Staff.instrumentName = "Barthlme"
        \new Voice = "BassoII" { \dynamicUp \BassoII }
      }
      \new Lyrics \lyricsto BassoII \BassoIILyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { indent = 2\cm }
}
